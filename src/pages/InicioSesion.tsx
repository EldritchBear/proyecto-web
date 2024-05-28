import React from "react";

const InicioSesion: React.FC = () => {
  return (
    <>
      <h1 className="flex justify-center text-4xl font-bold mt-8">
        Inicio de sesión
      </h1>
      <form className="flex flex-col justify-center items-center" action="/" method="get">
        <input type="text" name="Nombre de usuario" placeholder="Nombre de usuario" className="w-1/2 h-12 border border-black rounded-lg px-4 py-2 my-2 mx-2" required minLength={4} maxLength={30} />
        <input type="password" name="Contraseña" placeholder="Contraseña" className="w-1/2 h-12 border border-black rounded-lg px-4 py-2 my-2 mx-2" required minLength={4} maxLength={30} />
        <div className="w-full h-full my-16 flex flex-col items-center justify-center">
          <button className="text-lg text-slate-600 my-10 block bg-neutral-900 mx-auto hover:bg-neutral-800 text-white px-14 py-2 rounded-md my-10 mx-4">
              Iniciar sesión
          </button>
          <a href="/registrarse" className="text-lg text-slate-600 w-fit">Registrarse</a>
        </div>
      </form>
    </>
  );
};

export default InicioSesion;
