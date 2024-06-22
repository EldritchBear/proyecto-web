import React from "react";
import { useParams } from "react-router-dom";

const Editar: React.FC = () => {
  const { id } = useParams<{ id: string }>()
  return (
    <>
      <nav className="">
        <a href="/robot" className="w-20 h-20 block">
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
              <h3 className="text-xl">{id}</h3>
            </div>
          </div>
          <ul className="my-16 mb-14 flex flex-col justify-between h-full grow separate divide-dashed divide-y-2">
            <li className="flex grow justify-between items-center text-xl py-4">
              <span className="">Velocidad</span>
              100%
            </li>
            <li className="flex grow justify-between items-center text-xl py-4">
              <span className="">Frecuencia sensor</span>
              test
            </li>
            <li className="flex grow justify-between items-center text-xl py-4">
              <span className="">Notificaciones</span>
              <svg
                width="44"
                height="30"
                viewBox="0 0 44 30"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <rect width="44" height="30" rx="15" fill="#90D397" />
                <rect
                  x="16"
                  y="3.75"
                  width="24"
                  height="22.5"
                  rx="11.25"
                  fill="white"
                />
              </svg>
            </li>
          </ul>
        </div>
      </div>
    </>
  );
};

export default Editar;
