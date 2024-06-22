import React from "react";

type Robot = {
  name: string;
}

const robots: Robot[] = [
    {
        name: "Robot 1"
    },
    {
        name: "Robot 2"
    },
    {
        name: "Robot 3"
    }
]

const Robot: React.FC = () => {
  return (
    <>
      <nav className="">
        <a href="/" className="w-20 h-20 block">
            <svg className="w-full h-full" xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960"><path d="M400-240 160-480l240-240 56 58-142 142h486v80H314l142 142-56 58Z"/></svg>
        </a>
      </nav>
      <div className="w-full h-full grow my-24 flex flex-col justify-between">
          {robots.map((robot: Robot) => (
              <div
                  key={robot.name}
                  className="w-full border border-black px-12 py-6 flex justify-between items-center my-2"
              >
                  <div className="w-24 h-20 bg-slate-300"></div>
                  <div className="flex flex-col justify-center items-center">
                      <h3 className="text-xl">{robot.name}</h3>
                      <a href={"/editar/" + robot.name} className="text-lg text-slate-600 w-fit">Editar</a>
                  </div>
              </div>
          ))}
      </div>
    </>
  );
};

export default Robot;
