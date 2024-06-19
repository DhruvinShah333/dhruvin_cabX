from typing import List

from classes import Person
from typing import List
import database
import random


async def add_curr_pool(curr_pool: List[Person], curr_strength: int, zone: str, master_pool_id: int):
    """
    add this pool to the database
    We are just adding the user_ids of the person to the table
    - so here make a pool_id which is unique
    - make a query string that has 4 fields and those could be NULL coz its not necessary that there are exactly 4 people in  a pool
    - insert that query into the database
    """
    print(curr_pool[0])
    conn, cursor = database.make_db()
    size = len(curr_pool)
    pool_ids = [-1, -1, -1, -1]
    for i in range(size):
        pool_ids[i] = curr_pool[i].user_id
    print(pool_ids)
    check_query = f"""
    select * from active_pools where zone = '{zone}' and pool_id1 = {pool_ids[0]} and pool_id2 = {pool_ids[1]} and pool_id3 = {pool_ids[2]} and pool_id4 = {pool_ids[3]}
    """
    cursor.execute(check_query)
    res = cursor.fetchall()
    if len(res) != 0:
      print("Already Added")
      return
    insert_query = f"""
    insert into active_pools values ({master_pool_id}, '{zone}', {pool_ids[0]}, {pool_ids[1]}, {pool_ids[2]}, {pool_ids[3]}, {curr_strength}, 4, FALSE)
    """
    cursor.execute(insert_query)
    print("Added an active pool")
    pooled_query = f"""
    update pool_applications set pooled = TRUE where pool_id in ({pool_ids[0]}, {pool_ids[1]}, {pool_ids[2]}, {pool_ids[3]})
    """
    cursor.execute(pooled_query)
    conn.commit()
    conn.close()



async def pool_people_zone(data: List[Person], zone: str):
    """
    I have an array of people and each person in that array is a 4-tuple with (min, max, num_people, user_id)
    I need to sort them based on min
    Have a curr_pool array and keep adding people that are being pooled to this array.
    """
    curr, conn = database.make_db()
    people = sorted(data, key=lambda x: x.min)
    # make a master_pool_id
    conn, cursor = database.make_db()
    master_pool_id = random.randint(1_000, 10_000)
    check_query = f"""
    select * from active_pools where master_pool_id = {master_pool_id}
    """
    cursor.execute(check_query)
    result = cursor.fetchall()
    master_pool_ids = []
    for each in result:
        master_pool_ids.append(each[0])
    while master_pool_id in master_pool_ids:
        master_pool_id = random.randint(1_000, 10_000)
    curr_pool = []
    curr_limit = 4
    curr_strength = 0
    for person in people:
        if curr_pool == []:
            curr_pool.append(person)
            curr_strength += person.num_people
            curr_limit = person.max
            if curr_strength == curr_limit:
                await add_curr_pool(curr_pool, curr_strength, zone, master_pool_id)
                curr_pool = []
                curr_strength = 0
                curr_limit = 4
                # break
            continue
        # Now to extend the pooling
        new_limit = min(curr_limit, person.max)
        if curr_strength + person.num_people > new_limit:
            continue
        curr_pool.append(person)
        curr_strength += person.num_people
        curr_limit = new_limit
        if curr_strength == curr_limit:
            await add_curr_pool(curr_pool, curr_strength, zone, master_pool_id)
            curr_pool = []
            curr_strength = 0
            curr_limit = 4
        else:
            continue







