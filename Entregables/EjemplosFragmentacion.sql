--Qué es la fragmentación horizontal? 

"Es una técnica de distribución de datos en la que una tabla se divide en subconjuntos de filas (tuplas), normalmente basándose en un criterio lógico, como el valor de una columna. Esto permite almacenar estos fragmentos en diferentes nodos o servidores, mejorando la eficiencia y localización de los datos. 

datos para una universidad, con una tabla Estudiantes" 

 

CREATE TABLE Estudiantes ( 

    id INT PRIMARY KEY, 
    nombre VARCHAR(50),
    carrera VARCHAR(50), 
    ciudad VARCHAR(50) 
); 


Ingresar datos 

🧩 Fragmentación horizontal 

Criterio de fragmentación: ciudad del estudiante. 

🔹 Fragmento 1 (Estudiantes_Quito): 

-- Fragmento Quito 

CREATE TABLE Estudiantes_Quito ( 

    id INT PRIMARY KEY, 

    nombre VARCHAR(50), 

    carrera VARCHAR(50), 

    ciudad VARCHAR(50) 

); 

  

-- Insertamos las filas correspondientes 

INSERT INTO Estudiantes_Quito VALUES 

(1, 'Ana Pérez', 'Ingeniería', 'Quito'), 

(3, 'Carla Ruiz', 'Ingeniería', 'Quito'); 

 

 Fragmento 2 (Estudiantes_Ambato): 

 

-- Fragmento Ambato 

CREATE TABLE Estudiantes_Ambato ( 

    id INT PRIMARY KEY, 

    nombre VARCHAR(50), 

    carrera VARCHAR(50), 

    ciudad VARCHAR(50) 

); 

  

INSERT INTO Estudiantes_Ambato VALUES 

(2, 'Luis Mora', 'Medicina', 'Ambato'), 

(5, 'Rosa Vega', 'Medicina', 'Ambato'); 

 

 Fragmento 3 (Estudiantes_Cuenca): 

 

-- Fragmento Cuenca 

CREATE TABLE Estudiantes_Cuenca ( 

    id INT PRIMARY KEY, 

    nombre VARCHAR(50), 

    carrera VARCHAR(50), 

    ciudad VARCHAR(50) 

); 

  

INSERT INTO Estudiantes_Cuenca VALUES 

(4, 'Mario León', 'Derecho', 'Cuenca'), 

(6, 'J. Ortega', 'Derecho', 'Cuenca'); 


construcción de la tabla original (vista global) 

 

--Si quisiéramos consultar toda la tabla original, podríamos usar una vista como esta: 

 

CREATE VIEW Estudiantes_Todos AS 

SELECT * FROM Estudiantes_Quito 

UNION ALL 

SELECT * FROM Estudiantes_Ambato 

UNION ALL 

SELECT * FROM Estudiantes_Cuenca; 



 --Ventajas de esta fragmentación 
"
Mejora el rendimiento local de las consultas. 

Permite mantener la información más cerca del usuario o de los sistemas que la necesitan. 

Facilita la escalabilidad horizontal. "