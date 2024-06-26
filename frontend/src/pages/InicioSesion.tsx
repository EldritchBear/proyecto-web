import React, { useState } from "react";
import { useHistory } from 'react-router-dom';
import { login } from '../services/auth';

const InicioSesion: React.FC = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const history = useHistory();

  const handleSubmit = async (e: any) => {
    e.preventDefault();
    try {
      await login(email, password);
      history.push('/');
    } catch (error) {
      alert('Login failed');
    }
  };

  return (
    <>
      <h1 className="flex justify-center text-4xl font-bold mt-8">
        Inicio de sesión
      </h1>
      <form onSubmit={handleSubmit} className="flex flex-col justify-center items-center" action="/" method="get">
        <input 
          type="email" 
          name="E-mail" 
          onChange={(e) => setEmail(e.target.value)}
          placeholder="E-mail" 
          className="w-1/2 h-12 border border-black rounded-lg px-4 py-2 my-2 mx-2"
          required 
          minLength={4} 
          maxLength={30} 
        />
        <input
          type="password"
          name="Contraseña"
          placeholder="Contraseña"
          onChange={(e) => setPassword(e.target.value)}
          className="w-1/2 h-12 border border-black rounded-lg px-4 py-2 my-2 mx-2"
          required 
          minLength={4} 
          maxLength={30} 
        />
        <div className="w-full h-full my-16 flex flex-col items-center justify-center">
          <button className="text-lg text-white my-10 block bg-neutral-900 mx-auto hover:bg-neutral-800 px-14 py-2 rounded-md">
            Iniciar sesión
          </button>
          <a href="/registrarse" className="text-lg text-slate-600 w-fit">Registrarse</a>
        </div>
      </form>
    </>
  );
};

export default InicioSesion;
