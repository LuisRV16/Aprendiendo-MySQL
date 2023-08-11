CREATE database proveedores;

use proveedores;

CREATE TABLE proveedor(
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(25),
    categoria INT,
    ciudad VARCHAR(25),
    PRIMARY KEY (id)
);

INSERT INTO proveedor (nombre, categoria, ciudad) VALUES
	('SurteTodo', 146, 'Tampico'),
    ('Acarreame', 158, 'Tampico'),
    ('Surtete', 146, 'Cd. Madero'),
    ('SurtidoRico', 147, 'Cd.Madero'),
    ('DandoAbarrote', 145, 'Altamira'),
    ('TeLoDoyTodo', 146, 'Altamira');
    
CREATE TABLE articulo(
	id INT NOT NULL AUTO_INCREMENT,
	descripcion VARCHAR(60),
    ciudad VARCHAR(25),
    precio FLOAT,
    PRIMARY KEY (id)
);

INSERT INTO articulo (descripcion, ciudad, precio) VALUES
	('Cama', 'Tampico', 8000),
    ('Transformer Bumblebee', 'Cd. Madero', 499),
    ('Cemento Cruz Azul', 'Altamira', 800),
    ('Huevo Kinder', 'Tampico', 25),
    ('Xbox Series X', 'Cd. Madero', 12999.99),
    ('Spider-Man 616 Figura Marvel Legends', 'Altamira', 499.99),
    ('Pulparindo', 'Tampico', 10),
    ('Kinder Delice', 'Tampico', 10),
    ('Manzana', 'Cd. Madero', 50),
    ('Platano', 'Altamira', 25),
    ('Chayote', 'Altamira', 16);
    
CREATE TABLE cliente(
	id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(25),
    ciudad VARCHAR(25),
    PRIMARY KEY(id)
);

INSERT INTO cliente (nombre, ciudad) VALUES
	('Ana García', 'Tampico'),
	('Juan Martínez', 'Cd. Madero'),
	('María Rodríguez', 'Altamira'),
	('Carlos López', 'Tampico'),
	('Luisa González', 'Cd. Madero'),
	('Pedro Pérez', 'Altamira'),
	('Laura Sánchez', 'Tampico'),
	('José González', 'Cd. Madero'),
	('Alejandra Martínez', 'Altamira'),
	('Sergio Ramírez', 'Tampico'),
	('Diana Herrera', 'Cd. Madero'),
	('Javier García', 'Altamira'),
	('Fernanda Morales', 'Tampico'),
	('Ricardo Martínez', 'Cd. Madero'),
	('Paulina Sánchez', 'Altamira'),
	('Roberto Torres', 'Tampico'),
	('Elena Rodríguez', 'Cd. Madero'),
	('Mario López', 'Altamira'),
	('Isabel Martínez', 'Tampico'),
	('Daniel Pérez', 'Cd. Madero');
    
CREATE TABLE pedido(
	id INT NOT NULL AUTO_INCREMENT,
    id_proveedor INT NOT NULL,
    id_articulo INT NOT NULL,
    id_cliente INT NOT NULL,
    cantidad INT,
    precio_total INT,
    FOREIGN KEY(id_proveedor) REFERENCES proveedor(id),
    FOREIGN KEY(id_articulo) REFERENCES articulo(id),
    FOREIGN KEY(id_cliente) REFERENCES cliente(id),
    PRIMARY KEY(id)
);

SELECT * FROM articulo;
SELECT * FROM proveedor;

INSERT INTO pedido (id_proveedor, id_articulo, id_cliente, cantidad) VALUES
	(1,1,1,1),
    (4,4,1,5),
    (2,5,2,1),
    (4,7,2,7),
    (2,6,3,1),
    (5,9,3,2),
    (5,10,4,5),
    (5,11,4,7),
    (2,2,5,5),
    (2,6,5,1),
    (4,8,6,10),
    (3,3,6,20),
    (4,4,7,8),
    (4,8,7,4),
    (6,1,8,2),
    (2,5,8,1),
    (3,3,9,10),
    (5,9,9,10),
    (2,2,10,1),
    (2,5,10,1),
    (2,2,11,1),
    (2,6,11,1),
    (4,7,12,2),
    (5,9,12,1),
    (5,10,13,5),
    (3,1,13,1),
    (4,4,14,4),
    (4,8,14,8),
    (3,1,15,10),
    (2,5,15,10),
    (6,3,16,15),
    (1,1,16,1),
    (3,3,17,5),
    (2,6,17,1),
    (2,5,18,1),
    (1,3,18,3),
    (4,4,19,1),
    (4,7,19,2),
    (5,9,20,1),
    (5,10,20,4);

UPDATE pedido p JOIN articulo a ON p.id_articulo = a.id
SET p.precio_total = (a.precio * p.cantidad);

SELECT * FROM pedido;

SELECT * FROM pedido p JOIN articulo a ON p.id_articulo = a.id;

SELECT descripcion, precio, cantidad, precio_total FROM pedido p JOIN articulo a ON p.id_articulo = a.id; --

CREATE TABLE provee(
	id_proveedor INT NOT NULL,
    id_articulo INT NOT NULL,
    FOREIGN KEY(id_proveedor) REFERENCES proveedor(id),
    FOREIGN KEY(id_articulo) REFERENCES articulo(id),
    PRIMARY KEY(id_proveedor, id_articulo)
);

INSERT INTO provee (id_proveedor, id_articulo) VALUES
	(01, 01),
    (01, 03),
    (03, 01),
    (03, 03),
    (06, 01),
    (06, 03),
    (02, 02),
    (02, 05),
    (02, 06),
    (04, 04),
    (04, 07),
    (04, 08),
    (05, 09),
    (05, 10),
    (05, 11);
    
SELECT * FROM provee;

-- 1
SELECT p.id_proveedor FROM provee p WHERE p.id_articulo = 3;

-- 2
SELECT nombre FROM pedido p JOIN cliente c ON p.id_cliente = c.id
WHERE id_proveedor = 3;

-- 3
SELECT c.nombre, pr.categoria FROM cliente c JOIN (pedido p JOIN proveedor pr ON p.id_proveedor = pr.id)
ON p.id_cliente = c.id WHERE pr.categoria > 145;

-- 4
SELECT p.id FROM pedido p JOIN cliente c ON p.id_cliente = c.id WHERE c.ciudad = 'Cd. Madero';
-- Si quiero saber el producto que compró:
SELECT a.descripcion, c.ciudad FROM articulo a JOIN (pedido p JOIN cliente c ON p.id_cliente = c.id)
ON p.id_articulo = a.id WHERE c.ciudad = 'Cd. Madero';

-- 5
SELECT a.descripcion, a.ciudad, c.nombre, c.ciudad FROM articulo a
JOIN (pedido p JOIN cliente c ON p.id_cliente = c.id)
ON a.id = p.id_articulo WHERE a.ciudad = 'Tampico' and c.ciudad = 'Cd. Madero';

-- 6
SELECT id_articulo, id_cliente FROM pedido WHERE id_cliente = 1 and id_articulo not in
(SELECT id_articulo FROM pedido WHERE id_cliente = 8);

-- 7
-- ciudad 1: Tampico
-- ciudad 2: Cd. Madero
SELECT pr.nombre AS Proveedor, pr.ciudad AS ciudad1, c.ciudad AS ciudad2 FROM cliente c
JOIN (pedido p JOIN proveedor pr ON p.id_proveedor = pr.id)
ON p.id_cliente = c.id WHERE pr.ciudad = 'Tampico' and c.ciudad = 'Cd. Madero';

-- 8
SELECT MAX(pr.categoria) AS Proveedor FROM proveedor pr JOIN (provee p JOIN articulo a
ON p.id_articulo = a.id) ON p.id_proveedor = pr.id WHERE a.descripcion = 'Cama';

-- 9
SELECT pr.id AS Id_Proveedor, pr.nombre AS Proveedor FROM proveedor pr JOIN provee p
ON pr.id = p.id_proveedor JOIN pedido pd ON p.id_proveedor = pd.id_proveedor JOIN cliente c
ON pd.id_cliente = c.id JOIN articulo a ON a.id = pd.id_articulo
	WHERE a.precio = (
		SELECT MAX(precio) FROM articulo WHERE id in (
			SELECT id_articulo FROM pedido
				WHERE id_cliente in (SELECT id FROM cliente WHERE cliente.ciudad = 'Altamira'
            )
		)
	);

-- 10
SELECT c.id, c.nombre FROM cliente c JOIN pedido pd ON pd.id_cliente = c.id
	GROUP BY c.id HAVING COUNT(DISTINCT pd.id_articulo) >= 2;
    
-- 12
SELECT pr.id, pr.nombre, COUNT(DISTINCT p.id_articulo) FROM proveedor pr JOIN provee p ON pr.id = p.id_proveedor
	GROUP BY pr.id;
    

