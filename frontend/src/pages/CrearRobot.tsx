import React from "react";
import { useHistory } from 'react-router-dom';
import { fetchWithAuth } from '../services/auth';

export const sendFormDataAsJson = async (url: string, data: Record<string, any>) => {
  const response = await fetchWithAuth(url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({robot: data}),
  });

  return response;
};

const CrearRobot: React.FC = () => {
  const history = useHistory();

  const handleSubmit = async (event: any) => {
    event.preventDefault();
    const formData = new FormData(event.currentTarget);
    try {
      const data = Object.fromEntries(formData.entries());

      try {
        const response = await sendFormDataAsJson('/api/robot/create', data);
        if (response.ok) {
          // Handle successful registration
          console.log('User registered successfully');
          history.push('/inicio_sesion');
        } else {
          // Handle error
          console.error('Registration failed');
        }
      } catch (error) {
        console.error('An error occurred:', error);
      }
      history.push('/robot');
    } catch (error) {
      alert('Login failed');
    }
  };

  

  return (
    <>
      <h1 className="flex justify-center text-4xl font-bold mt-8">
        Añadir robot
      </h1>
      <form onSubmit={handleSubmit} className="flex flex-col justify-center items-center" action="/" method="get">
        <input
          type="text"
          name="frecuencia_sensor"
          // onChange={(e) => setEmail(e.target.value)}
          placeholder="Frecuencia de sensor"
          className="w-1/2 h-12 border border-black rounded-lg px-4 py-2 my-2 mx-2"
          required
          maxLength={30}
        />
        <input
          type="number"
          name="velocidad"
          placeholder="Velocidad"
          // onChange={(e) => setPassword(e.target.value)}
          className="w-1/2 h-12 border border-black rounded-lg px-4 py-2 my-2 mx-2"
          required
        />
        <div className="flex gap-4 items-center text-nowrap">
          Activar notificaciones
          <input
            type="checkbox"
            name="notificaciones"
            placeholder="Activar notificaciones"
            // onChange={(e) => setPassword(e.target.value)}
            className="w-1/2 h-12 border border-black rounded-lg px-4 py-2 my-2 mx-2"
          />
        </div>
        <div className="w-full h-full my-16 flex flex-col items-center justify-center">
          <button className="text-lg text-white my-10 block bg-neutral-900 mx-auto hover:bg-neutral-800 px-14 py-2 rounded-md">
            Añadir
          </button>
        </div>
      </form>
    </>
  );
};

export default CrearRobot;
