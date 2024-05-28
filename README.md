
EP2.3

Los datos de la aplicación se encontrarán almacenados en una base de datos relacional utilizando el motor PostgreSQL, los datos se encontraran almacenados de la siguiente forma:

Tabla Robots

CREATE TABLE robots (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);


Tabla Victimas

CREATE TABLE victimas (
    id SERIAL PRIMARY KEY,
    estado VARCHAR(255) NOT NULL
);


Tabla Simulaciones

CREATE TABLE simulaciones (
    id SERIAL PRIMARY KEY,
    id_robot INT NOT NULL,
    FOREIGN KEY (id_robot) REFERENCES robots(id)
);

Tabla Link Simulaciones-Victimas

CREATE TABLE simulacion_victimas (
    id_simulacion INT NOT NULL,
    id_victima INT NOT NULL,
    PRIMARY KEY (id_simulacion, id_victima),
    FOREIGN KEY (id_simulacion) REFERENCES simulaciones(id),
    FOREIGN KEY (id_victima) REFERENCES victimas(id)
);

EP 2.4

Para los patrones de diseño actualmente estamos utilizando Component Layout para los botones de navegación en cada página para poder proveer una experiencia consistente al moverse entre las paginas.

Nos encontramos utilizando Validación de evento (Event Based Input Validation) para validar el formulario al momento de registrarse.
