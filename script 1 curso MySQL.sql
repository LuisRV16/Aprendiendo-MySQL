create database holamundo; -- Se crea la base de datos con el nombre dado.

show databases; -- Muestra todas las bases de datos existentes.

use holamundo;

CREATE TABLE animales(
	id int,
    tipo varchar(255),
    estado varchar(255),
    PRIMARY KEY (id)
);

-- INSERT INTO animales (tipo, estado) VALUES ('chanchito', 'feliz');
-- insertar datos en la tabla animales para los campos específicados

ALTER TABLE animales modify column id int auto_increment;
-- comando utilizado para modificar una tabla previamente creada, se específica que se quiere
-- modificar una columna y se específica que columna, en este caso se específica
-- que es el campo id de tipo int para que cada id tome un valor entero auto incremental, así este será
-- irrepetible.

SHOW CREATE TABLE animales;
-- comando que se utiliza para obtener el comando que crea la tabla y con esto mostrar la tabla
-- previamente creada.

CREATE TABLE `animales` (
   `id` int NOT NULL AUTO_INCREMENT,
   `tipo` varchar(255) DEFAULT NULL,
   `estado` varchar(255) DEFAULT NULL,
   PRIMARY KEY (`id`)
 );
 
 INSERT INTO animales (tipo, estado) VALUES ('chanchito', 'feliz');
 INSERT INTO animales (tipo, estado) VALUES ('dragon', 'feliz');
 INSERT INTO animales (tipo, estado) VALUES ('felipe', 'triste');
 
 SELECT * FROM animales;
 SELECT * FROM animales WHERE id = 6;
 SELECT * FROM animales WHERE estado = 'feliz';
 -- SELECT permite seleccionar elementos que se encuentran dentro de una tabla
 -- se pasan los nombres de las columnas que queremos mostrar.
 -- WHERE se utiliza como condicional simple.
 
 UPDATE animales SET estado = 'molesto' WHERE id = 3;
 -- UPDATE se utiliza para indicar que los datos de nuestra tabla serán actualizados
 -- SET lo utilizamos para agregar o modificar la variable estado donde nuestra PK
 -- sea igual a 3 o mejor dicho, el campo estado de la fila con el id 3.alter
 
 UPDATE animales SET estado = 'feliz' WHERE id = 3;
 
 DELETE FROM animales WHERE estado = 'feliz';
 
-- Error Code: 1175. You are using safe update mode and you tried to update a table
-- without a WHERE that uses a KEY column.  To disable safe mode, toggle the option
-- in Preferences -> SQL Editor and reconnect.

DELETE FROM animales WHERE id <= 3;

SELECT * FROM animales;
-- Esto tambien arroja el error 1175

-- Todas las anteriores consultas fueron las básicas (CRUD).

CREATE TABLE user(
	id int not null auto_increment,
    name varchar(50) not null,
    edad int not null,
    email varchar(100) not null,
    primary key (id)
);

INSERT INTO user (name, edad, email) values ('Oscar', 25, 'oscar@gmail.com');
INSERT INTO user (name, edad, email) values ('Layla', 15, 'layla@gmail.com');
INSERT INTO user (name, edad, email) values ('Nicolas', 36, 'nico@gmail.com');
INSERT INTO user (name, edad, email) values ('Chanchito', 7, 'oscar@gmail.com');

SELECT * FROM user;
SELECT * FROM user limit 1;
-- limit limita la cantidad de recursos que se van a retornar hacia el usuario
-- en este caso se limitara a devolver el primer registro que la consulta encuentra.

SELECT * FROM user WHERE edad > 15;
SELECT * FROM user WHERE edad >= 15;
SELECT * FROM user WHERE edad > 20 and email = 'nico@gmail.com';
SELECT * FROM user WHERE edad > 20 or email = 'layla@gmail.com';
SELECT * FROM user WHERE email != 'layla@gmail.com';
SELECT * FROM user WHERE edad between 15 and 30;
SELECT * FROM user WHERE email like '%gmail%'; -- puede comenzar y terminar con cualquier cosa
SELECT * FROM user WHERE email like '%gmail'; -- puede comenzar con cualquier cosa, pero tiene que terminar con gmail
SELECT * FROM user WHERE email like 'oscar%'; -- puede terminar en cualquier cosa, pero tiene que empezar con oscar
SELECT * FROM user order by edad asc;
-- order by estamos indicando que nos muestre todos nuestros registros de nuestra busqueda ordenados en orden ascendente(asc)

SELECT * FROM user order by edad desc;
-- order by estamos indicando que nos muestre todos nuestros registros de nuestra busqueda ordenados en orden descendente(desc)

SELECT max(edad) as mayor from user;
-- Muestra el dato de mayor edad de nuestra tabla user y en el momento de mostrar la columna toma el nombre de mayor

SELECT min(edad) as menor from user;
-- Muestra el dato de menor edad de nuestra tabla user y en el momento de mostrar la columna toma el nombre de menor

SELECT id, name from user;
SELECT id as Identificador, name as Nombre from user;