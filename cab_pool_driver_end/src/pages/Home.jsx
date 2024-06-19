import { Box, Typography } from "@mui/material";
import axios from "axios";
import React from "react";
import RideCards from "../components/RideCards";

const Home = () => {
  // I need to send a get request at /driver_fetch_pools to get all the pools at a timeout of 2sec

  const [pools, setPools] = React.useState([]);

  const backendUrl = `${import.meta.env.VITE_BACKEND_URL}/driver_fetch_pools`;

  React.useEffect(() => {
    const fetchPools = async () => {
      try {
        await axios
          .get(backendUrl)
          .then((response) => {
            if (response.data.status === 200) {
              setPools(response.data.pools);
            } else {
              console.log(response.data.message);
              return (
                <Box>
                  <Typography variant="h4" color="initial">
                    Available Rides :
                  </Typography>
                  <div>
                    <Typography variant="h6" color="initial">
                      Could not Fetch
                    </Typography>
                  </div>
                </Box>
              );
            }
          })
          .catch((error) => {
            console.error(error);
            return (
              <Box>
                <Typography variant="h4" color="initial">
                  Available Rides :
                </Typography>
                <div>
                  <Typography variant="h6" color="initial">
                    Could not Fetch
                  </Typography>
                </div>
              </Box>
            );
          });
        } catch (error) {
          console.error(error);
          return (
            <Box>
              <Typography variant="h4" color="initial">
                Available Rides :
              </Typography>
              <div>
                <Typography variant="h6" color="initial">
                  Could not Fetch
                </Typography>
              </div>
            </Box>
          );
      }
    };

    fetchPools();
  }, [backendUrl]);

  return (
    <Box>
      <Typography variant="h4" color="initial">
        Available Rides :
      </Typography>
      <div>
        {pools.map((each, index) => {
          // console.log(each);
          return <RideCards key={index} each={each} />;
        })}
      </div>
    </Box>
  );
};

export default Home;
