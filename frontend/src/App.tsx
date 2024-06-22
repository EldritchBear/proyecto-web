import React from 'react';
import { Redirect, Route } from 'react-router-dom';
import { IonApp, IonRouterOutlet, setupIonicReact } from '@ionic/react';
import { IonReactRouter } from '@ionic/react-router';
import Layout from './components/Layout';
import Inicio from './pages/Inicio';
import Robot from './pages/Robot';
import Estado from './pages/Estado';
import MiCuenta from './pages/MiCuenta';
import Editar from './pages/Editar';
import Historial from './pages/Historial';
import InicioSesion from './pages/InicioSesion';
import Registrarse from './pages/Registrarse';

/* Core CSS required for Ionic components to work properly */
import '@ionic/react/css/core.css';

/* Basic CSS for apps built with Ionic */
import '@ionic/react/css/normalize.css';
import '@ionic/react/css/structure.css';
import '@ionic/react/css/typography.css';

/* Optional CSS utils that can be commented out */
import '@ionic/react/css/padding.css';
import '@ionic/react/css/float-elements.css';
import '@ionic/react/css/text-alignment.css';
import '@ionic/react/css/text-transformation.css';
import '@ionic/react/css/flex-utils.css';
import '@ionic/react/css/display.css';

/* Theme variables */
import './theme/variables.css';

import './theme/tailwind.css';

setupIonicReact();

const App: React.FC = () => (
  <IonApp>
    <IonReactRouter>
      <IonRouterOutlet>
        <Route exact path="/">
          <Layout active="Inicio">
            <Inicio />
          </Layout>
        </Route>
        <Route exact path="/robot">
          <Layout active="Robot">
            <Robot />
          </Layout>
        </Route>
        <Route exact path="/estado">
          <Layout active="Estado">
            <Estado />
          </Layout>
        </Route>
        <Route exact path="/cuenta">
          <Layout active="Mi Cuenta">
            <MiCuenta />
          </Layout>
        </Route>
        <Route exact path="/editar/:id">
          <Layout active="Robot">
            <Editar />
          </Layout>
        </Route>
        <Route exact path="/historial">
          <Layout active="Inicio">
            <Historial />
          </Layout>
        </Route>
        <Route exact path="/inicio_sesion">
          <Layout active="_">
            <InicioSesion />
          </Layout>
        </Route>
        <Route exact path="/registrarse">
          <Layout active="_">
            <Registrarse />
          </Layout>
        </Route>
        <Route exact path="/index">
          <Redirect to="/" />
        </Route>
      </IonRouterOutlet>
    </IonReactRouter>
  </IonApp>
);

export default App;
