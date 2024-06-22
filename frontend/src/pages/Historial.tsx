import React from "react";

type Simulation = {
  name: string;
  people: Person[];
};

type Person = {
  name: string;
  status: "Encontrado" | "No encontrado";
};

const simulations: Simulation[] = [
  {
    name: "Simulación 1",
    people: [
      {
        name: "Persona 1",
        status: "Encontrado",
      },
      {
        name: "Persona 2",
        status: "Encontrado",
      },
      {
        name: "Persona 3",
        status: "No encontrado",
      },
    ],
  },
  {
    name: "Simulación 2",
    people: [
      {
        name: "Persona 4",
        status: "Encontrado",
      },
      {
        name: "Persona 5",
        status: "Encontrado",
      },
      {
        name: "Persona 6",
        status: "No encontrado",
      },
    ],
  },
  {
    name: "Simulación 3",
    people: [
      {
        name: "Persona 7",
        status: "Encontrado",
      },
      {
        name: "Persona 8",
        status: "Encontrado",
      },
      {
        name: "Persona 9",
        status: "No encontrado",
      },
    ],
  },
];

const Historial: React.FC = () => {
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
      <div className="w-full h-full grow my-24 flex flex-col justify-between">
        {simulations.map((simulation: Simulation) => (
          <div
            key={simulation.name}
            className="w-full border border-black px-12 py-6 flex justify-between items-center my-2"
          >
            <div className="w-24 h-20 bg-slate-300"></div>
            <div className="flex flex-col justify-center items-center">
              <h3 className="text-xl">{simulation.name}</h3>
              {simulation.people.map((person: Person) => (
                <p
                  key={person.name}
                  className="text-lg text-slate-600 w-fit flex flex-col"
                >
                  {person.name}: {person.status}
                </p>
              ))}
            </div>
          </div>
        ))}
      </div>
    </>
  );
};

export default Historial;
