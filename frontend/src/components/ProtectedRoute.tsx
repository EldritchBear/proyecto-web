import React from 'react';
import { Route, Redirect, RouteProps } from 'react-router-dom';
import { isLoggedIn } from '../services/auth';

interface ProtectedRouteProps extends RouteProps {
  component: React.ComponentType<any>;
}

const ProtectedRoute: React.FC<ProtectedRouteProps> = ({ component: Component, ...rest }) => (
  <Route
    {...rest}
    render={(props) =>
      isLoggedIn() ? (
        <Component {...props} />
      ) : (
        <Redirect to="/inicio_sesion" />
      )
    }
  />
);

export default ProtectedRoute;
