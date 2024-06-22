import React from "react";

const Inicio: React.FC = () => {
  return (
    <>
      <nav className="justify-center mx-auto">
        <img
          className="h-12 w-24 rounded-full shadow-lg"
          src="https://i.kym-cdn.com/entries/icons/original/000/049/004/lebronsunshinecover.jpg"
        ></img>
      </nav>
      <div className="w-full h-full grow my-16 flex flex-col justify-between">
        <div className="h-full grow flex flex-col justify-center">
          <div className="w-full h-full my-16 flex flex-col justify-between">
            <button className="bg-neutral-900 mx-auto hover:bg-neutral-800 text-white px-14 py-2 rounded-md my-1 mx-4">
              Iniciar Simulación
            </button>

            <button className="mx-auto px-14 py-2 rounded-md my-1 mx-4">
              <a
                href="/historial"
                className="text-neutral-700 hover:text-neutral-900"
              >
                Historial Simulaciones
              </a>
            </button>
          </div>
        </div>
      </div>
    </>
  );
};

export default Inicio;
