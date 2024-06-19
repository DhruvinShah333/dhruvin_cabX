from pydantic import BaseModel


class User_Register(BaseModel):
    email: str
    phone: str
    name: str
    photoURL: str

class User_Profile_Create(BaseModel):
    email: str
    first_name: str
    last_name: str
    # phone: str
    # address: str
    # city: str
    # state: str
    # zip: str

class Driver_Register(BaseModel):
  email: str
  password: str
  photoURL: str
  name: str
  phone: str
  car_no: str
  car_model: str

class User_Login_Token(BaseModel):
    token: str


class User_Login(BaseModel):
    email: str

class Driver_Login(BaseModel):
    email: str
    password: str

class Pool_Ride_Register(BaseModel):
    email: str # sorted
    timeslot: int   # sorted
    zone: str # sorted
    numpeople: int # taken
    min: int # sorted
    max: int # sorted
    time: str
    date: str
    start: str 
    destination: str

class Accept_Pool_Ride(BaseModel):
    pool_id: int
    driver_email: str


class Instant_Ride_Register(BaseModel):
    email: str
    time: str
    numpeople: int
    start: str
    destination: str


class Accept_Instant_Ride(BaseModel):
    instant_id: int
    driver_email: str


class Accept_Pool_Ride(BaseModel):
    master_pool_id: int
    driver_email: str


# to get a specific pool
class Specific_Pool(BaseModel):
    pool_id: int


class My_Pool_Customer(BaseModel):
    email: str

class My_Pool_Driver(BaseModel):
    email: str

