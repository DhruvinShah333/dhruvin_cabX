import Card from "@mui/material/Card";
import CardActions from "@mui/material/CardActions";
import CardContent from "@mui/material/CardContent";
import CardMedia from "@mui/material/CardMedia";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import { useContext } from "react";
import { authContext } from "../context/AuthContextProvider";
import axios from "axios";
import { useNavigate } from "react-router-dom";

export default function RideCards({ each}) {
  const { user } = useContext(authContext);
  const navigate = useNavigate();

  const handleClick = (e) => {
    e.preventDefault();
    console.log(each);
    // send a post request at /driver_accept_pool to accept the ride. And the req should have the master_pool_id from each and the email of the driver
    const requestData = {
      master_pool_id: each.master_pool_id,
      driver_email: user.email,
    };
    try{
      axios.post(`${import.meta.env.VITE_BACKEND_URL}/driver_accept_pool`, requestData)
        .then(
          (response) => {
            if (response.data.status === 200) {
              console.log(response.data.message);
              navigate('/home');
            } else {
              console.log(response.data.message);
            }
          }
        )
        .catch((error) => {
          console.error(error);
        });
    }
    catch (error) {
      console.error(error);
    }
  }

  return (
    <Card sx={{ maxWidth: 345 }}>
      <CardMedia
        sx={{ height: 140 }}
        image="/src/assets/map.jpeg"
        title="green iguana"
      />
      <CardContent>
        <Typography gutterBottom variant="h5" component="div">
          {each.end}
        </Typography>
        <Typography variant="body2" color="text.secondary">
          {each.start}
        </Typography>
        <Typography variant="body2" color="text.secondary">
          ${each.cost}
        </Typography>
      </CardContent>
      <CardActions>
        <Button size="small" onClick={(e) => handleClick(e)}>GO</Button>
      </CardActions>
    </Card>
  );
}
