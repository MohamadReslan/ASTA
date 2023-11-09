/**** CIBLE : MySQL ****/

/*On supprime les tables si elles existent */
DROP TABLE IF EXISTS USER;
DROP TABLE IF EXISTS PROGRAM;
DROP TABLE IF EXISTS COMPANY;
DROP TABLE IF EXISTS EVALUATION;
DROP TABLE IF EXISTS MISSION;

CREATE TABLE PROGRAM(
                        id INT,
                        label VARCHAR(50),
                        diploma_year VARCHAR(50),
                        major VARCHAR(50),
                        PRIMARY KEY(id)
);

INSERT INTO PROGRAM VALUES (1, 'L1', '2020-2025', ''),
                           (2, 'L1', '2021-2026', ''),
                           (3, 'L2', '2018-2022', ''),
                           (4, 'L3-LSI', '2020-2025', ''),
                           (5, 'L3-RS', '2019-2024', ''),
                           (6, 'L3-DATA', '2019-2024', ''),
                           (7, 'L3-DATA', '2020-2025', ''),
                           (8, 'M1-LSI', '2022-2027', ''),
                           (9, 'M2-DATA', '2019-2024', 'Software engineer'),
                           (10, 'M2-RS', '2020-2025', 'Digital transformation'),
                           (11, 'M2-LSI', '2020-2025', 'Management');

CREATE TABLE COMPANY(
                        id INT,
                        name VARCHAR(50),
                        address VARCHAR(50),
                        access_info VARCHAR(50),
                        PRIMARY KEY(id)
);

INSERT INTO COMPANY VALUES (1, 'Bouygues', '10 rue du chaperon vert PARIS 75015', 'Batiment A - etage 3'),
                           (2, 'Credit agricole', '50 avenue du parc PARIS 75008', 'Badge'),
                           (3, 'Dassault System', '30 boulevard du maine PARIS 75018', 'Piece didentite'),
                           (4, 'Karyon', '5 rue de la plaine  PARIS 75010', 'Interphone code 98532'),
                           (5, 'Clever age', '32 rue blanche PARIS 75002', 'Badge'),
                           (6, 'Gudule', '96 rue le dantec PARIS 75013', 'Porte 3');

CREATE TABLE USER(
                     id SMALLINT AUTO_INCREMENT,
                     last_name VARCHAR(50),
                     first_name VARCHAR(50),
                     mdp VARCHAR(50),
                     phone VARCHAR(50),
                     mail VARCHAR(50) UNIQUE,
                     manager_name VARCHAR(50),
                     type VARCHAR(50),
                     is_active BOOLEAN,
                     is_archive BOOLEAN,
                     company_id INT NULL,
                     program_id INT NULL,
                     related_user_id INT NULL,
                     PRIMARY KEY(id),
                     FOREIGN KEY(company_id) REFERENCES COMPANY(id),
                     FOREIGN KEY(program_id) REFERENCES PROGRAM(id),
                     FOREIGN KEY (related_user_id) REFERENCES USER(id)
);

INSERT INTO USER VALUES (1, 'Bond', 'James', 'jb1234', '0623412152', 'jbond@gmail.com', 'Marc Bonnel', 'apprenti', false, false, 1, 1, 11),
                        (2, 'Martin', 'Sophie', 'ms1234', '0612345678', 'sophie.martin@gmail.com', 'Martin Coquelin', 'apprenti', false, false, 2, 2, 12),
                        (3, 'Lefebvre', 'Luc', 'll1234', '0345678912', 'luc.lefebvre@gmail.com', 'Alix Remy', 'apprenti', false, false, 3, 3, 13),
                        (4, 'Dubois', 'Isabelle', 'di1234', '0456789012', 'isabelle.dubois@gmail.com', 'Emilie Duret', 'apprenti', false, false, 4, 4, 14),
                        (5, 'Bertrand', 'Antoine', 'ba1234', '0234567890', 'antoine.bertrand@gmail.com', 'Beatrice Boullet', 'apprenti', false, false, 5, 5, 15),
                        (6, 'Girard', 'Jeanne', 'ge1234', '0678901234', 'jeanne.girard@gmail.com', 'Charles Duchemin', 'apprenti', false, false, 6, 6, 11),
                        (7, 'Roux', 'Thierry', 'rt1234', '0789012345', 'thierry.roux@gmail.com', 'Louis Girard', 'apprenti', false, false, 1, 7, 12),
                        (8, 'Leroy', 'Nathalie', 'ln1234', '0212345678', 'nathalie.leroy@gmail.com', 'Paul Rouanet', 'apprenti', false, false, 2, 8, 13),
                        (9, 'Petit', 'Lucas', 'pl1234', '0567890123', 'lucas.petit@gmail.com', 'Jade Cuvier', 'apprenti', false, false, 3, 9, 14),
                        (10, 'Moreau', 'Marie', 'mm1234', '0345678901', 'marie.moreau@gmail.com', 'Sabrina Cuvier', 'apprenti', false, false, 4, 10, 15),
                        (11, 'Caron', 'Catherine', 'cc1234', '0789012345', 'catherine.caron@gmail.com', NULL, 'tuteur', true, false, NULL, NULL, NULL),
                        (12, 'Renaud', 'Thomas', 'rt1234', '0567890123', 'thomas.renaud@gmail.com', NULL, 'tuteur', true, false, NULL, NULL, NULL),
                        (13, 'Fournier', 'Marie', 'fm1234', '0345678901', 'marie.fournier@gmail.com', NULL, 'tuteur', true, false, NULL, NULL, NULL),
                        (14, 'Lemoine', 'François', 'lf1234', '0123456789', 'francois.lemoine@gmail.com', NULL, 'tuteur', true, false, NULL, NULL, NULL),
                        (15, 'Dupont', 'Pierre', 'dp1234', '0123456789', 'pierre.dupont@gmail.com', NULL, 'tuteur', true, false, NULL, NULL, NULL);

CREATE TABLE EVALUATION(
                           id INT,
                           grade DECIMAL(15,2),
                           type VARCHAR(50),
                           date_ DATE,
                           comment VARCHAR(50),
                           theme VARCHAR(50),
                           id_1 SMALLINT NOT NULL,
                           PRIMARY KEY(id),
                           FOREIGN KEY(id_1) REFERENCES USER(id)
);

INSERT INTO EVALUATION VALUES (1, 16.0, 'memoire', '2023-01-15', 'Tres bien', 'creation dun site', 1),
                              (2, 14.5, 'soutenance', '2023-03-10', 'Bien', 'nouvelle application', 2),
                              (3, 17.2, 'memoire', '2023-05-20', 'Excellent', 'gerer une base de donnees', 3),
                              (4, 13.8, 'soutenance', '2023-07-05', 'Assez bien', 'securisation dun serveur', 4),
                              (5, 15.7, 'memoire', '2023-09-12', 'Tres satisfaisant', 'design d une nouvelle interface client', 5),
                              (6, 18.3, 'soutenance', '2023-11-08', 'Tres bien', 'comment maintenir un reseau entreprise', 6),
                              (7, 14.0, 'memoire', '2023-02-18', 'Bien', 'developper un logiciel', 7),
                              (8, 16.8, 'soutenance', '2023-04-30', 'Tres bien', 'faire un support technique', 8),
                              (9, 13.2, 'memoire', '2023-08-14', 'Assez bien', 'creer une strategie marketing', 9),
                              (10, 17.5, 'soutenance', '2023-10-22', 'Excellent', 'proteger des donnees sensibles', 10);


CREATE TABLE MISSION(
    id INT,
    keyword VARCHAR(50),
    job VARCHAR(50),
    comment VARCHAR(500),
    userId SMALLINT NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(userId),
    FOREIGN KEY(userId) REFERENCES USER(id)
);

INSERT INTO MISSION VALUES (1, 'html, css, js', 'developpeur web', 'developpeur pour notre nouveau site de cuisine', 1),
                           (2, 'Java', 'Ingenieur logiciel', 'Developpement dune application Java', 2),
                              (3, 'sql, python', 'Data Analyst', 'Analyse des donnees de vente', 3),
                              (4, 'systeme', 'Administrateur systeme', 'Gestion des serveurs et de la securite', 4),
                              (5, 'concepteur', 'Designer UX/UI', 'Conception de l interface utilisateur pour une application mobile', 5),
                           (6, 'reseau', 'Ingenieur reseau', 'Configuration et maintenance du reseau d entreprise', 6),
                              (7, 'C#', 'Developpeur logiciel', 'Developpement dun logiciel de gestion des stocks', 7),
                           (8, 'technicien, support, informatique', 'Technicien support', 'Fournir un support technique aux utilisateurs', 8),
                           (9, 'marketing', 'Consultant en marketing', 'Conseil en strategie marketing pour une entreprise cliente', 9),
                           (10, 'cybersecurite', 'Ingenieur en securite', 'Mise en place de mesures de securite pour proteger les donnees sensibles', 10);