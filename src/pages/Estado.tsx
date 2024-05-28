import React from "react";

type Victima = {
  name: string;
  status: "Encontrado" | "No encontrado";
};

const victimas: Victima[] = [
  {
    name: "Victima 1",
    status: "Encontrado",
  },
  {
    name: "Victima 2",
    status: "Encontrado",
  },
  {
    name: "Victima 3",
    status: "No encontrado",
  },
];

const Estado: React.FC = () => {
  return (
    <>
      <nav>
        <a href="/index" className="w-20 h-20 block">
          <svg
            className="w-full h-full"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 -960 960 960"
          >
            <path d="M400-240 160-480l240-240 56 58-142 142h486v80H314l142 142-56 58Z" />
          </svg>
        </a>
      </nav>
      {victimas.map((victima) => (
        <div
          key={victima.name}
          className="w-full border border-black px-12 py-6 flex justify-between items-center my-2"
        >
          <div className="w-24 h-20 bg-slate-300"></div>
          <div className="flex flex-col justify-center items-center">
            <h3 className="text-xl">{victima.name}</h3>
            <a
              href={"#/victima/" + victima.name}
              className="text-lg text-slate-600 w-fit"
            >
              {victima.status}
            </a>
          </div>
        </div>
      ))}
    </>
  );
};

export default Estado;
