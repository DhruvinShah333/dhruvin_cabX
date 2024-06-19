import random

from stuff import models, database
from .database import make_db
import hashlib
import secrets


async def get_cost_per_person(distance: int, cost_per_lit: int, numpeople: int, mileage: int):
    cost = float (distance * cost_per_lit * 2.5) / (mileage * numpeople)
    rounded_cost = round(cost, 0)
    return rounded_cost



async def handle_register(data: models.User_Register):
    conn, cursor = database.make_db()
    print("Hello")
    """
    Adding the inactive user to the database
    """
    query = f"""
    insert into registered_people values ('{data.email}', '{data.phone}', '{data.name}', '{data.photoURL}', TRUE)
    """
    cursor.execute(query)
    conn.commit()
    conn.close()
    return {
        'status': 200,
        'message': "Registration Successful",
    }


async def handle_driver_register(data: models.Driver_Register):
    conn, cursor = database.make_db()
    """
    Check if the driver exists in the driver table
    Adding the driver to the database
    """
    check_query = f"""
    select * from drivers where email = '{data.email}'
    """
    cursor.execute(check_query)
    res = cursor.fetchall()
    if len(res) > 0:
        return {
            'message': "Driver already exists",
            'status': 500
        }
    query = f"""
    insert into drivers values ('{data.email}','{hashlib.sha256((data.password).encode()).hexdigest()}', '{data.photoURL}', '{data.name}', '{data.phone}', '{data.car_no}', '{data.car_model}')
    """
    cursor.execute(query)
    conn.commit()
    conn.close()
    return {
        'status': 200,
        'message': "Driver Registration Successful",
    }


async def handle_profile_create(data: models.User_Profile_Create):
    conn, cursor = database.make_db()
    """
    Check if the user exists in the first table
    If not, then ask the user to register
    If yes, then add the user to the second table
    """
    check_query = f"""
    select * from <table> where email = '{data.email}'
    """
    cursor.execute(check_query)
    res = cursor.fetchall()
    if len(res) == 0:
        return {
            'message': "User does not exist. Please register first",
            'email': data.email,
            'status': None
        }
    elif len(res) > 1 & data.email == res[0][0] & res[0][1] == False:
        query = f"""
        insert into <table> values ('{data.name}', '{data.email}', '{data.age}')
        """
        cursor.execute(query)
        conn.commit()
        conn.close()
        return {
            'message': "Added user to the database",
            'email': data.email,
            'status': True
        }
    else:
        return {
            'message': "Profile already exists",
            'email': data.email,
            'status': True
        }


def generate_token(email):
    # Generate a token using email and a random salt
    salt = secrets.token_urlsafe(16)
    token_string = email + salt
    token = hashlib.sha256(token_string.encode()).hexdigest()
    return token


async def handle_login(data: models.User_Login):
    # Connect to the database
    conn, cursor = make_db()

    # Query to check if the user exists and is active
    query = f"SELECT * FROM registered_people WHERE email = '{data.email}'"
    cursor.execute(query)
    res = cursor.fetchall()

    if len(res) == 0:
        # User does not exist. Return an error message.
        return {
            'message': "User does not exist. Please register first",
            'status': 500,
        }
    elif len(res) > 1 or (data.email == res[0][0] and not res[0][4]):
        # More than one user found with the same email or user exists but is not active.
        return {
            'status': 500,
            'message': "User exists but is not active. Please register first",
        }
    else:
        # User exists and is active. Generate a token.
        token = generate_token(data.email)

        # Store the token in the database
        insert_query = f"INSERT INTO login_token VALUES ('{data.email}', '{token}')"
        cursor.execute(insert_query)
        conn.commit()
        conn.close()

        # Return the token to the user
        print(token)
        return {
            'message': "User exists",
            'email': data.email,
            'status': 200,
            'token': token,
        }


async def handle_login_via_token(data: models.User_Login_Token):
    # Connect to the database
    conn, cursor = make_db()

    # Query to check if the token exists
    query = f"SELECT * FROM login_token WHERE token = '{data.token}'"
    cursor.execute(query)
    res = cursor.fetchall()

    if len(res) == 0:
        # Token does not exist. Return an error message.
        return {
            'message': "Invalid token",
            'status': 404
        }
    else:
        # Token exists. Get the user details.
        email = res[0][0]
        user_query = f"SELECT * FROM registered_people WHERE email = '{email}'"
        cursor.execute(user_query)
        user_res = cursor.fetchall()

        # Return the user details
        return {
            'message': "User exists",
            'status': 200,
            'email': user_res[0][0],
            'phone': user_res[0][1],
            'name': user_res[0][2],
            'photoURL': user_res[0][3],
        }


async def handle_driver_login(data: models.Driver_Login):
    conn, cursor = database.make_db()
    query1 = f"""
    select * from drivers where email = '{data.email}' and password = '{hashlib.sha256((data.password).encode()).hexdigest()}'
    """
    
    query2 = f"""
    select * from drivers where email = '{data.email}'
    """
    cursor.execute(query2)
    res2 = cursor.fetchall()
    if len(res2) == 0:
        return {
            'message': "Driver does not exist. Please register first",
            'status': 404
        }
    
    cursor.execute(query1)
    res = cursor.fetchall()
    if len(res2) != 0 and len(res) == 0:
        return {
            'message' : 'Wrong Password',
            'status' : '400'
        }
    return {
        'message': "Driver exists",
        'status': 200,
        'email': res[0][0],
        'photoURL': res[0][2],
        'name': res[0][3],
        'phone': res[0][4],
        'car_no': res[0][5],
        'car_model': res[0][6]
    }


async def handle_pool_ride_register(data: models.Pool_Ride_Register):
    conn, cursor = database.make_db()
    """
    Adding the incoming pool to the pool table    
    """
    # generate a unique pool_id
    pool_id = random.randint(1_000, 10_000)
    check_query = f"""
    select * from pool_applications where pool_id = '{pool_id}'
    """
    cursor.execute(check_query)
    result = cursor.fetchall()
    pool_ids = []
    for each in result:
        pool_ids.append(each[0])
    while pool_id in pool_ids:
        pool_id = random.randint(1_000, 10_000)
    query = f"""
    insert into pool_applications values ({pool_id}, '{data.email}', '{data.timeslot}', '{data.zone}', '{data.numpeople}', '{data.min}', '{data.max}', '{data.time}', '{data.date}', '{data.start}', '{data.destination}', FALSE)
    """
    cursor.execute(query)
    conn.commit()
    conn.close()
    distance = 59
    mileage = 12
    cost_per_lit = 100
    travel_time = 120
    cost = await get_cost_per_person(distance, cost_per_lit, data.numpeople, mileage)*(data.numpeople)
    return {
        'message': "Added pool to the database",
        'pool_id': pool_id,
        'cost': cost,
        'time': travel_time
    }


async def handle_instant_ride_register(data: models.Instant_Ride_Register):
    """
    Adding the incoming target to the instant ride register table
    """
    # make a unique instant_id
    instant_id = random.randint(1_000, 10_000)
    conn, cursor = database.make_db()
    check_query = f"""
    select * from instant_applications where instant_id = '{instant_id}'
    """
    cursor.execute(check_query)
    result = cursor.fetchall()
    instant_ids = []
    for each in result:
        instant_ids.append(each[0])
    while instant_id in instant_ids:
        instant_id = random.randint(1_000, 10_000)
    mileage = 12  # dummy
    cost_per_lit = 100  # dummy
    distance = 59  # dummy
    travel_time = 120  # dummy in minutes
    cost = await get_cost_per_person(distance, cost_per_lit, data.numpeople, mileage)
    conn, cursor = database.make_db()
    query = f"""
    insert into instant_applications values ({instant_id}, '{data.email}', '{data.time}', {data.numpeople}, '{data.start}', '{data.destination}', {cost}, {travel_time})
    """
    cursor.execute(query)
    conn.commit()
    conn.close()
    return {
        'message': "Added instant ride to the database",
        "email": data.email,
        'cost': cost,
        'travel_time': travel_time,
        'start': data.start,
        'destination': data.destination,
    }


async def driver_fetch_pool():
    """
    - fetch all the pools from active_pools table and send
    """
    conn, cursor = database.make_db()
    query = f"""
    select * from active_pools where accepted = FALSE
    """
    cursor.execute(query)
    
    res = cursor.fetchall()
    result = []
    for each in res:
        strength = 0
        for i in [2, 3, 4, 5]:
            if each[i] != -1:
                strength += 1
        cost = await  get_cost_per_person(59, 100, strength, 12)*strength
        ride = {
            "master_pool_id": each[0],
            "strength":  strength,
            "cost": cost,
            "start": "IIT Hyderabad",
            "end": each[1]
        }
        result.append(ride)
    conn.close()
    return {
        'status': 200,
        'message': "Fetched all the pools",
        'pools': result
    }


async def driver_accept_pool(data: models.Accept_Pool_Ride):
    """
    Check if the pool exists
    - Add the driver email to the pool in the accept_pools table
    """
    conn, cursor = database.make_db()
    query = f"""
    select * from active_pools where master_pool_id = {data.master_pool_id} and accepted = FALSE
    """
    cursor.execute(query)
    res = cursor.fetchall()
    if len(res) == 0:
        return {
            'message': "No such pool exists",
            'status': 404
        }
    insert_query = f"""
    insert into accept_pools values ({data.master_pool_id}, '{data.driver_email}')
    """
    cursor.execute(insert_query)
    delete_query = f"""
    update active_pools set accepted = TRUE where master_pool_id = {data.master_pool_id}
    """
    cursor.execute(delete_query)
    conn.commit()
    conn.close()
    return {
        'message': "Accepted the pool",
        'status': 200,
        'pool': {
            'master_pool_id': res[0][0],
            'start': "IIT Hyderabad",
            'end': res[0][1],
            'strength': res[0][6],
            "cost": await get_cost_per_person(59, 100, res[0][6], 12)*res[0][6],
            "travel_time": 120
        }
    }


async def driver_fetch_instant():
    """
    Fetch all the instant rides
    """
    conn, cursor = database.make_db()
    query = f"""
    select * from instant_applications
    """
    cursor.execute(query)
    res = cursor.fetchall()
    result = []
    for each in res:
        user_data_query = f"""
        select * from registered_people where email = '{each[1]}'
        """
        cursor.execute(user_data_query)
        user_data = cursor.fetchall()
        ride = {
            'instant_id': each[0],
            'email': each[1],
            'name': user_data[0][2],
            'phone': user_data[0][1],
            'photoURL': user_data[0][3],
            'time': each[2],
            'numpeople': each[3],
            'start': each[4],
            'destination': each[5],
            'cost': each[6],
            'travel_time': each[7]
        }
        result.append(ride)
    conn.close()
    return {
        'message': "Fetched all the instant rides",
        'instant': result
    }


async def driver_accept_instant(data: models.Accept_Instant_Ride):
    """
    Accept the instant ride
    - get all the details of the instant ride
    - add it to the accept_instant table and add the driver email to the table from the data
    - then delete it from the main table
    """
    conn, cursor = database.make_db()
    query = f"""
    select * from instant_applications where instant_id = {data.instant_id}
    """
    print(query)
    cursor.execute(query)
    res = cursor.fetchall()
    if len(res) == 0:
        return {
            'message': "No such instant ride exists",
            'status': 404
        }
    ride = res[0]
    insert_query = f"""
    insert into accept_instant values ({data.instant_id}, '{data.driver_email}')
    """
    cursor.execute(insert_query)
    conn.commit()
    conn.close()
    return {
        'message': "Accepted the instant ride",
        'status': 200,
        "ride": {
            'instant_id': ride[0],
            'email': ride[1],
            'time': ride[2],
            'numpeople': ride[3],
            'start': ride[4],
            'destination': ride[5],
            'cost': ride[6],
            'travel_time': ride[7]
        }
    }


async def handle_specific_pool(data: models.Specific_Pool):
    """
    Add the information of the other people in the pool as well
    """
    conn, cursor = database.make_db()
    query = f"""
    select * from pool_applications where pool_id = {data.pool_id}
    """
    cursor.execute(query)
    results = cursor.fetchall()
    result = results[0]
    distance = 10
    answer = {
        "pool_id": data.pool_id,
        "email": result[1],
        "timeslot": result[2],
        "zone": result[3],
        "numpeople": result[4],
        "min": result[5],
        "max": result[6],
        "time": result[7],
        "date": result[8],
        "start": result[9],
        "destination": result[10]
    }
    # getting all the other pools which have our pool_id
    query = f"""
    select * from active_pools where pool_id1 = {data.pool_id} or pool_id2 = {data.pool_id} or pool_id3 = {data.pool_id} or pool_id4 = {data.pool_id}
    """
    cursor.execute(query)
    res = cursor.fetchall()
    pool_ids = []
    people_in_pool = []
    master_pool_id = -1
    strength = result[4]
    if len(res) != 0:
      master_pool_id = res[0][0]
      strength = res[0][6]
      for i in range(2, 6):
          if res[0][i] != -1:
              pool_ids.append(res[0][i])
      # get all the emails of the people with the pool_ids
      for id in pool_ids:
          query = f"""
          select name, email, phone, photoURL from registered_people where email = (select email from pool_applications where pool_id = {id})
          """
          cursor.execute(query)
          result = cursor.fetchall()
          if len(result) == 0:
            continue
          person = {
              "name": result[0][0],
              "email": result[0][1],
              "phone": result[0][2],
              "photoURL": result[0][3]
          }
          people_in_pool.append(person)
    answer['people'] = people_in_pool
    # getting the driver details
    query = f"""
    select * from accept_pools natural join drivers where master_pool_id = {master_pool_id}
    """
    cursor.execute(query)
    res = cursor.fetchall()
    if len(res) == 0:
      driver = {
        "email": "YET TO ACCEPT",
        "master_pool_id": master_pool_id,
        "photoURL": "YET TO ACCEPT",
        "name": "YET TO ACCEPT",
        "phone": "YET TO ACCEPT",
        "car_no": "YET TO ACCEPT",
        "car_model": "YET TO ACCEPT"
      }
    else:
      driver = {
          "email": res[0][0],
          "master_pool_id": res[0][1],
          "photoURL": res[0][3],
          "name": res[0][4],
          "phone": res[0][5],
          "car_no": res[0][6],
          "car_model": res[0][7]
      }
    answer['driver'] = driver
    conn.close()
    answer['cost'] = await get_cost_per_person(59, 100, strength, 12)* strength
    return answer


async def handle_get_my_pool_customer(data: models.My_Pool_Customer):
    # Get all the pools which have this particular email and return all the data that is there in the pool_applications table
    conn, cursor = database.make_db()
    query = f"""
    select * from pool_applications where email = '{data.email}'
    """
    cursor.execute(query)
    res = cursor.fetchall()
    if len(res) == 0:
        return {
            'message': "No pool created yet",
            'code': 450
        }
    result = []
    for each in res:
        answer = {
            "pool_id": each[0],
            "timeslot": each[2],
            "zone": each[3],
            "time": each[7],
            "date": each[8],
            "start": each[9],
            "destination": each[10]
        }
        result.append(answer)
    conn.close()
    return result





# async def handle_get_my_pool_customer(data: models.My_Pool_Customer):
#     try:
#         conn, cursor = database.make_db()
#         query = f"""
#         select pool_id from pool_applications where email = '{data.email}'
#         """
#         cursor.execute(query)
#         pool_ids = cursor.fetchall()
#         answers = []
#         for i in range(len(pool_ids)):
#             pool_id = pool_ids[0][i]
#             print(pool_id)
#             # getting all the other pools which have our pool_id
#             query = f"""
#             select * from active_pools where pool_id1 = {pool_id} or pool_id2 = {pool_id} or pool_id3 = {pool_id} or pool_id4 = {pool_id}
#             """
#             cursor.execute(query)
#             res = cursor.fetchall()
#             if len(res) == 0:
#                 return {
#                     'message' : 'No pool created yet',
#                     'code' : 450
#                 }
#             print(res)
#             strength = res[0][6]
#             zone = res[0][1]
#             pools = []
#             for i in range(2, 6):
#                 if res[0][i] != -1:
#                     pools.append(res[0][i])
#
#             people_in_pool = []
#             for id in pools:
#                 query = f"""
#                 select name, email, phone, photoURL from registered_people where email = (select email from pool_applications where pool_id = {id})
#                 """
#                 cursor.execute(query)
#                 result = cursor.fetchall()
#                 person = {
#                     "name": result[0][0],
#                     "email": result[0][1],
#                     "phone": result[0][2],
#                     "photoURL": result[0][3]
#                 }
#                 people_in_pool.append(person)
#             conn.close()
#             answer = {
#                 "pool_id": pool_id,
#                 "strength": strength,
#                 "zone": zone,
#                 "people": people_in_pool
#             }
#             answers.append()
#         return answers
#     except Exception as e:
#         print(e)
#         return {'message' : "Internal Server Error"}

async def handle_get_my_pool_driver(data: models.My_Pool_Driver):
    conn, cursor = database.make_db()
    query = f"""
    select * from active_pools natural join accept_pools where email = '{data.email}'
    """
    cursor.execute(query)
    res = cursor.fetchall()
    strength = res[0][6]
    pools = []
    for i in range(2, 6):
        if res[0][i] != -1:
            pools.append(res[0][i])
    people_in_pool = []
    for id in pools:
        query = f"""
        select name, email, phone, photoURL from registered_people where email = (select email from pool_applications where pool_id = {id})
        """
        cursor.execute(query)
        result = cursor.fetchall()
        print(query)
        person = {
            "name": result[0][0],
            "email": result[0][1],
            "phone": result[0][2],
            "photoURL": result[0][3]
        }
        people_in_pool.append(person)
    conn.close()
    answer = {
        "strength": strength,
        "cost": await get_cost_per_person(59, 100, strength, 12)*strength,
        "people": people_in_pool
    }

