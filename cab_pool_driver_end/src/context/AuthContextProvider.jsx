import { createContext, useState } from "react";

const authContext = createContext();

const AuthContextProvider = ({ children }) => {

  const [user, setUser] = useState({
    email: '',
    password: ''
  });
  const [isLogged, setIsLogged] = useState(false);

  return (
    <authContext.Provider value={{ user, setUser, isLogged, setIsLogged }}>
      {children}
    </authContext.Provider>
  );
};

export { AuthContextProvider, authContext };
export default AuthContextProvider;
