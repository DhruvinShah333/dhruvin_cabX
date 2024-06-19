import database
from pool_people import pool_people_zone
from classes import Person


async def make_pool():
    conn, cursor = database.make_db()
    """
    I have a table of people looking for pools stored in postgres, I need to sort them based on zones and start pooling people    
    Lets go zone by zone 
    - Fetch people
    - If there are people in that zone then start pooling them
        - Then move to the next zone
    - If no people then move to the next zone
    """
    zones = ['RGAI', 'Miyapur', 'Hitex', 'Gachibowli', 'Charminar']
    for zone in zones:
        print(f"ZONE : {zone}")
        query = f"""
        select * from pool_applications where zone = '{zone}' and pooled = FALSE order by numpeople desc
        """
        cursor.execute(query)
        res = cursor.fetchall()
        print(res)
        my_people = []
        for each in res:
            my_people.append(Person(each[5], each[6], each[4], each[0]))
        print("## RES ##")
        print("## RES END ##")
        if len(res) > 1:
            # Start pooling
            res = await pool_people_zone(my_people, zone)
        else:
            continue
