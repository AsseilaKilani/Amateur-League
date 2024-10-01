DROP SCHEMA IF EXISTS GEO CASCADE;

CREATE SCHEMA GEO;

SET search_path TO GEO;





CREATE TABLE MER(
id_mer INT PRIMARY KEY,
nom_mer VARCHAR(100) NOT NULL
);


CREATE TABLE PAYS(
id_pays INT PRIMARY KEY,
nom_pays VARCHAR(100) NOT NULL,
superificie_pays INT
);





CREATE TABLE RIVIERE(
id_riviere INT PRIMARY KEY,
nom_riviere VARCHAR(100) NOT NULL,
longueur_riviere DECIMAL(10,2),
id_riviereAffluent INT,
FOREIGN KEY(id_riviereAffluent) REFERENCES RIVIERE(id_riviere),
id_mer INT REFERENCES MER(id_mer)
);


CREATE TABLE VILLE(
id_ville INT PRIMARY KEY,
nom_ville VARCHAR(100) NOT NULL,
nbHabitants INT,
id_riviere INT REFERENCES RIVIERE(id_riviere),
id_pays INT REFERENCES PAYS(id_pays)
);


CREATE TABLE BORDER(
id_mer INT,
id_pays INT,
PRIMARY KEY(id_mer, id_pays),
FOREIGN KEY(id_mer) REFERENCES MER(id_mer),
FOREIGN KEY(id_pays) REFERENCES PAYS(id_pays)
);

CREATE TABLE VOISIN(
id_pays1 INT REFERENCES PAYS(id_pays),
id_pays2 INT REFERENCES PAYS(id_pays),
PRIMARY KEY(id_pays1, id_pays2)

);

\dt

INSERT INTO PAYS VALUES
(1,'France', 670000),
(2,'Suisse', 41000),
(3,'Espagne', 505000),
(4,'Portugal', 92000),
(5,'Italie', 301000),
(6,'Grèce', 132000),
(7,'Allemagne', 357000),
(8,'Autriche', 83000);
INSERT INTO VOISIN VALUES
(1,2),
(1,3),
(1,5),
(2,1),
(2,5),
(3,1),
(3,4),
(4,3),
(5,1),
(5,2),
(7,1),
(7,2),
(7,5),
(7,8),
(8,2),
(8,5),
(8,7);



INSERT INTO MER VALUES
(1,'Méditerranée'),
(2,'Atlantique'),
(3,'Manche'),
(4,'Ionienne'),
(5,'Adriatique'),
(6,'Mer du Nord');

INSERT INTO BORDER VALUES
(1,1),
(1,5),
(1,6),
(1,3),
(2,1),
(2,3),
(2,4),
(3,1),
(4,5),
(4,6),
(5,5),
(6,1),
(6,7);




INSERT INTO RIVIERE VALUES
(1,'Rhone',812, null ,1),
(2,'Hérault',148, null ,1),
(3,'Isère',286, 1,null),
(4,'Durance',324, 1,null),
(5,'Seine',777, null,3),
(6,'Eure',228, 5 ,null),
(7,'Verdon',175, 4,null),
(8,'Nil',6500, 1,null),
(9,'Rhin', 1250,null,6);


INSERT INTO VILLE VALUES
(1,'Paris', 22000000, 5, 1),
(2,'Lyon', 500000, 1, 1),
(3,'Avignon', 100000, 4, 1),
(4,'Genève', 190000, 1, 2),
(5,'Grenoble', 160000, 3, 1),
(6,'Rouen', 110000, 5, 1),
(7,'Alberville', 17000, 3, 1),
(8,'Berne', 123000, null, 2),
(9,'Zurich', 365000, null, 2),
(10,'Arles', 53000, 1, 1),
(11,'Strasbourg',291000,9,1),
(12,'Cologne',1000000,9,7),
(13,'Salzbourg', 159000,null,8);
