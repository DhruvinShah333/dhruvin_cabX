import { Box, Typography } from "@mui/material";
import { Button, TextField } from "@mui/material";
import axios from "axios";
import { useState } from "react";
import { useContext } from "react";
import { authContext } from "../context/AuthContextProvider";
import { useNavigate } from "react-router-dom";

const Authentication = () => {
  const [login, setLogin] = useState(true);
  return (
    <Box>
      <Typography variant="h4" color="initial">
        Authentication
      </Typography>
      {login ? <LoginPage /> : <RegisterPage />}
      <Box>
        <Button onClick={() => setLogin(!login)}>
          {login ? "Register" : "Login"}
        </Button>
      </Box>
    </Box>
  );
};

const LoginPage = () => {
  const navigate = useNavigate();
  const {user, setUser, isLogged, setIsLogged} = useContext(authContext);
  const [driver, setDriver] = useState({
    email: "",
    password: "",
  });
  const handleChange = (e) => {
    e.preventDefault();
    setDriver({
      ...driver,
      [e.target.name]: e.target.value,
    });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const backendURL = import.meta.env.VITE_BACKEND_URL;
    axios
      .post(`${backendURL}/driver_login`, driver)
      .then((res) => {
        if(res.data.status === 200){
          console.log(res.data.message);
          setIsLogged(true);
          setUser({
            ...user,
            email: driver.email,
            name: res.data.name,
            phone: res.data.phone,
            car_no: res.data.car_no,
            car_model: res.data.car_model,
            photoURL: res.data.photoURL            
          });
          navigate("/home");
          return;
        }
        else{
          console.log(res.data.message);
        }
      })
      .catch((err) => {
        console.log(err);
      });
  };
  return (
    <Box>
      <Typography variant="h6" color="initial">
        Login
      </Typography>
      <form onSubmit={(e) => handleSubmit(e)}>
        <div>
          <label htmlFor="email">Email : </label>
          <input
            type="email"
            name="email"
            id="email"
            value={driver.email}
            onChange={(e) => handleChange(e)}
          />
        </div>
        <div>
          <label htmlFor="password">Password : </label>
          <input
            type="password"
            name="password"
            id="password"
            value={driver.password}
            onChange={(e) => handleChange(e)}
          />
        </div>
        <button type="submit">Login</button>
      </form>
    </Box>
  );
};

const RegisterPage = () => {
  const [driver, setDriver] = useState({
    email: "",
    password: "",
    photoURL: "random_URL",
    name: "",
    phone: "",
    car_no: "",
    car_model: "",
    chassis_no: "",
    engine_no: ""
  });
  const navigate = useNavigate();
  const { user, setUser, isLogged, setIsLogged } = useContext(authContext);


  const handleChange = (e) => {
    e.preventDefault();
    setDriver({
      ...driver,
      [e.target.name]: e.target.value,
    });
  }

  const handleSubmit = (e) => {
    e.preventDefault();
    const backendURL = import.meta.env.VITE_BACKEND_URL;
    axios
      .post(`${backendURL}/driver_register`, driver)
      .then((res) => {
        console.log(res.data.message);
        if(res.data.status === 200){
          setIsLogged(true);
          setUser({
            ...user,
            email: driver.email,
            name: driver.name,
            // phone: driver.phone,
            // car_no: driver.car_no,
            // car_model: driver.car_model,
            // photoURL: driver.photoURL,
            // rc_no: driver.rc_no
          });
          navigate("/home");
          return;
        }
      })
      .catch((err) => {
        console.log(err);
      });
  }


  return (
    <Box>
      <Typography variant="h6" color="initial">
        Register
      </Typography>
      <form onSubmit={(e) => handleSubmit(e)}>
        <div>
          <label htmlFor="email">Email : </label>
          <input
            type="email"
            name="email"
            id="email"
            value={driver.email}
            onChange={(e) => handleChange(e)}
          />
        </div>
        <div>
          <label htmlFor="password">Password : </label>
          <input
            type="password"
            name="password"
            id="password"
            value={driver.password}
            onChange={(e) => handleChange(e)}
          />
        </div>
        <div>
          <label htmlFor="name">Name : </label>
          <input
            type="text"
            name="name"
            id="name"
            value={driver.name}
            onChange={(e) => handleChange(e)}
          />
        </div>
        <div>
          <label htmlFor="phone">Phone : </label>
          <input
            type="text"
            name="phone"
            id="phone"
            value={driver.phone}
            onChange={(e) => handleChange(e)}
          />
        </div>
        <div>
          <label htmlFor="car_no">Car Number : </label>
          <input
            type="text"
            name="car_no"
            id="car_no"
            value={driver.car_no}
            onChange={(e) => handleChange(e)}
          />
        </div>
        <div>
          <label htmlFor="car_model">Car Model : </label>
          <input
            type="text"
            name="car_model"
            id="car_model"
            value={driver.car_model}
            onChange={(e) => handleChange(e)}
          />
        </div>
        <div>
          <label htmlFor="car_model">Chassis Number : </label>
          <input
            type="text"
            name="chassis_no"
            id="chassis_no"
            value={driver.chassis_no}
            onChange={(e) => handleChange(e)}
          />
        </div>
        <div>
          <label htmlFor="car_model">Engine Number : </label>
          <input
            type="text"
            name="engine_no"
            id="engine_no"
            value={driver.engine_no}
            onChange={(e) => handleChange(e)}
          />
        </div>
        <button type="submit">Register</button>
      </form>
    </Box>
  );
};

export default Authentication;
