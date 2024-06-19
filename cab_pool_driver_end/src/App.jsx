import './App.scss'
import NotFound from './NotFound';
import { RouterProvider, createBrowserRouter } from "react-router-dom";
import Root from './routes/Root';
import { useContext } from 'react';
import { authContext } from './context/AuthContextProvider';
import Authentication from './pages/Authentication';
import Home from './pages/Home';
import IndiRide from './pages/IndiRide';


function App() {
  const { user, setUser, isLogged, setIsLogged } = useContext(authContext);

    const router = createBrowserRouter([
      {
        path: "/",
        element: <Root />,
        errorElement: <NotFound />,
        children: [
          {
            path: "/",
            element: !isLogged ? <Authentication /> : <Home />
          },
          {
            path: "auth",
            element: isLogged ?  <Home /> : <Authentication />
          },
          {
            path: "home",
            element: isLogged ? <Home /> : <Authentication />
          },
          {
            path: 'indi',
            element: isLogged? <IndiRide /> : <Authentication />
          }
        ],
      },
    ]);

  return (
    <>
      <RouterProvider router={router} />
    </>
  );
}

export default App
