import React, { useEffect, useState } from "react";

type Datos = {
  nombre: string;
  correo: string;
  region: string;
  comuna: string;
}

const MiCuenta: React.FC = () => {
  const [datos, setDatos] = useState<Datos>();
  
  useEffect(() => {
    fetch('/datos_usuario.json')
      .then(response => response.json())
      .then(data => setDatos(data))
      .catch(error => console.error('Error cargando datos de archivo:', error));
  }, []);
  
  return (
    <>
      <nav className="">
        <a href="/" className="w-20 h-20 block">
          <svg
            className="w-full h-full"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 -960 960 960"
          >
            <path d="M400-240 160-480l240-240 56 58-142 142h486v80H314l142 142-56 58Z" />
          </svg>
        </a>
      </nav>
      <div className="w-full h-full grow my-16 flex flex-col justify-between">
        <div className="w-full h-full grow flex flex-col border border-black px-12 py-6 my-2">
          <div className="flex justify-between items-center">
            <div className="w-24 h-20 bg-slate-300"></div>
            <div className="flex flex-col justify-center items-center">
              <h3 className="text-xl">{datos?.nombre}</h3>
            </div>
          </div>
          <div className="w-full h-full grow flex flex-col px-12 py-6 my-2">
            <div className="flex justify-between items-center">
              <div className="my-2 mx-2">Correo: {datos?.correo}</div>
            </div>
            <div className="flex justify-between items-center">
              <div className="my-2 mx-2">Región: {datos?.region}</div>
              <div className="my-2 mx-2">Comuna: {datos?.comuna}</div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default MiCuenta;
