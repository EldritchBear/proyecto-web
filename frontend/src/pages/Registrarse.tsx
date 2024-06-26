import React, { useState } from "react";
import { useHistory } from 'react-router-dom';
import { fetchWithAuth } from "../services/auth";

const API_URL = 'http://localhost:4000';

export const sendFormDataAsJson = async (url: string, data: Record<string, any>) => {
  const response = await fetchWithAuth(url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({usuario: data}),
  });

  return response;
};

const emailIsValid = (email: string) => {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
};

const Registrarse: React.FC = () => {
  const [errors, setErrors] = useState<string[]>([]);
  const history = useHistory();

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    setErrors([]);

    const formData = new FormData(event.currentTarget);

    const newErrors: string[] = [];
    const formDataEntries = Array.from(formData.entries());
    for (const [nombre, valor] of formDataEntries) {
      const trimmedValue = (valor as string).trim();

      if (nombre === "terminos") continue;

      if (trimmedValue.length < 4)
        newErrors.push(`${nombre} no puede ser menor a 4 caracteres`);
      if (trimmedValue.length > 30)
        newErrors.push(`${nombre} no puede ser mayor a 30 caracteres`);

      if (nombre === "Correo" && !emailIsValid(trimmedValue))
        newErrors.push("El correo introducido no es válido");
    }

    const password = formData.get("Contraseña") as string;
    const confirmPassword = formData.get("Confirmar contraseña") as string;
    if (password !== confirmPassword)
      newErrors.push("Las contraseñas no coinciden");

    if (newErrors.length > 0) {
      setErrors(newErrors);
    } else {
      // const formData = new FormData(event.currentTarget);
      const data = Object.fromEntries(formData.entries());

      try {
        const response = await sendFormDataAsJson( '/sessions/registrar', data);
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
    }
  };

  return (
    <>
      <nav className="">
        <a href="/inicio_sesion" className="w-20 h-20 block">
          <svg
            className="w-full h-full"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 -960 960 960"
          >
            <path d="M400-240 160-480l240-240 56 58-142 142h486v80H314l142 142-56 58Z" />
          </svg>
        </a>
      </nav>
      <form className="flex flex-col justify-center items-center gap-2" onSubmit={handleSubmit}>
        <input type="text" name="nombre" placeholder="Nombre de usuario" className="w-1/2 h-12 border border-black rounded-lg px-4 py-2 my-2 mx-2" />
        <input type="email" name="email" placeholder="Correo" className="w-1/2 h-12 border border-black rounded-lg px-4 py-2 my-2 mx-2" />
        <input type="text" name="region" placeholder="Region" className="w-1/2 h-12 border border-black rounded-lg px-4 py-2 my-2 mx-2" />
        <input type="text" name="comuna" placeholder="Comuna" className="w-1/2 h-12 border border-black rounded-lg px-4 py-2 my-2 mx-2" />
        <input type="password" name="password" placeholder="Contraseña" className="w-1/2 h-12 border border-black rounded-lg px-4 py-2 my-2 mx-2" />
        <input type="password" name="" placeholder="Confirmar Contraseña" className="w-1/2 h-12 border border-black rounded-lg px-4 py-2 my-2 mx-2" />
        <div className="flex grow justify-center gap-8 items-center text-xl py-4">
          <span>Terminos y condiciones</span>
          <input type="checkbox" name="terminos" className="w-4 h-4" required />
        </div>
        <div className="w-full h-full flex flex-col items-center justify-center">
          <div className="my-2 text-red-500" id="errores">
            {errors.map((error, index) => (
              <div key={index}>{error}</div>
            ))}
          </div>
          <button type="submit" className="bg-neutral-900 mx-auto hover:bg-neutral-800 text-white px-14 py-2 rounded-md mx-2">
            Registrarse
          </button>
        </div>
      </form>
    </>
  );
};

export default Registrarse;
