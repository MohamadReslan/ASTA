/**** CIBLE : MySQL ****/

/*On supprime les tables si elles existent */
DROP TABLE IF EXISTS PROGRAM;
DROP TABLE IF EXISTS COMPANY;
DROP TABLE IF EXISTS USER;
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

INSERT INTO COMPANY VALUES (1, 'Bouygues', '10 rue du chaperon vert PARIS 75015', 'Batiment A - étage 3'),
                           (2, 'Crédit agricole', '50 avenue du parc PARIS 75008', 'Badge'),
                           (3, 'Dassault System', '30 boulevard du maine PARIS 75018', 'Pièce didentité'),
                           (4, 'Karyon', '5 rue de la plaine  PARIS 75010', 'Interphone code 98532'),
                           (5, 'Clever age', '32 rue blanche PARIS 75002', 'Badge'),
                           (6, 'Gudule', '96 rue le dantec PARIS 75013', 'Porte 3');

CREATE TABLE USER(
                     id SMALLINT AUTO_INCREMENT,
                     last_name VARCHAR(50),
                     first_name VARCHAR(50),
                     mdp VARCHAR(50),
                     phone VARCHAR(50),
                     mail VARCHAR(50),
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

INSERT INTO USER VALUES (1, 'Bond', 'James', 'jb1234', '0623412152', 'jbond@gmail.com', 'apprenti', false, false, 1, 1, 16),
                        (2, 'Martin', 'Sophie', 'ms1234', '0612345678', 'sophie.martin@gmail.com', 'apprenti', false, false, 2, 2, 17),
                        (3, 'Lefebvre', 'Luc', 'll1234', '0345678912', 'luc.lefebvre@gmail.com', 'apprenti', false, false, 3, 3, 18),
                        (4, 'Dubois', 'Isabelle', 'di1234', '0456789012', 'isabelle.dubois@gmail.com', 'apprenti', false, false, 4, 4, 19),
                        (5, 'Bertrand', 'Antoine', 'ba1234', '0234567890', 'antoine.bertrand@gmail.com', 'apprenti', false, false, 5, 5, 16),
                        (6, 'Girard', 'Élise', 'ge1234', '0678901234', 'elise.girard@gmail.com', 'apprenti', false, false, 6, 6, 17),
                        (7, 'Roux', 'Thierry', 'rt1234', '0789012345', 'thierry.roux@gmail.com', 'apprenti', false, false, 1, 7, 18),
                        (8, 'Leroy', 'Nathalie', 'ln1234', '0212345678', 'nathalie.leroy@gmail.com', 'apprenti', false, false, 2, 8, 19),
                        (9, 'Petit', 'Lucas', 'pl1234', '0567890123', 'lucas.petit@gmail.com', 'apprenti', false, false, 3, 9, 16),
                        (10, 'Moreau', 'Marie', 'mm1234', '0345678901', 'marie.moreau@gmail.com', 'apprenti', false, false, 4, 10, 17),
                        (11, 'Fontaine', 'Philippe', 'fp1234', '0789012345', 'philippe.fontaine@gmail.com', 'maitre apprentissage', true, false, 5, NULL, NULL),
                        (12, 'Marchand', 'Claire', 'mc1234', '0123456789', 'claire.marchand@gmail.com', 'maitre apprentissage', true, false, 6, NULL, NULL),
                        (13, 'Boucher', 'François', 'bf1234', '0456789012', 'francois.boucher@gmail.com', 'maitre apprentissage', true, false, 1, NULL, NULL),
                        (14, 'Chevalier', 'Julie', 'cj1234', '0234567890', 'julie.chevalier@gmail.com', 'maitre apprentissage', true, false, 2, NULL, NULL),
                        (15, 'Gauthier', 'Éric', 'ge1234', '0678901234', 'eric.gauthier@gmail.com', 'maitre apprentissage', true, false, 3, NULL, NULL),
                        (16, 'Caron', 'Catherine', 'cc1234', '0789012345', 'catherine.caron@gmail.com', 'tuteur', true, false, NULL, NULL, NULL),
                        (17, 'Renaud', 'Thomas', 'rt1234', '0567890123', 'thomas.renaud@gmail.com', 'tuteur', true, false, NULL, NULL, NULL),
                        (18, 'Fournier', 'Marie', 'fm1234', '0345678901', 'marie.fournier@gmail.com', 'tuteur', true, false, NULL, NULL, NULL),
                        (19, 'Lemoine', 'François', 'lf1234', '0123456789', 'francois.lemoine@gmail.com', 'tuteur', true, false, NULL, NULL, NULL),
                        (20, 'Dupont', 'Pierre', 'dp1234', '0123456789', 'pierre.dupont@gmail.com', 'tuteur', true, false, NULL, NULL, NULL);

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

INSERT INTO EVALUATION VALUES (1, 16.0, 'mémoire', '2023-01-15', 'Très bien', 'création dun site', 1),
                              (2, 14.5, 'soutenance', '2023-03-10', 'Bien', 'nouvelle application', 2),
                              (3, 17.2, 'mémoire', '2023-05-20', 'Excellent', 'gérer une base de données', 3),
                              (4, 13.8, 'soutenance', '2023-07-05', 'Assez bien', 'sécurisation dun serveur', 4),
                              (5, 15.7, 'mémoire', '2023-09-12', 'Très satisfaisant', 'design d une nouvelle interface client', 5),
                              (6, 18.3, 'soutenance', '2023-11-08', 'Très bien', 'comment maintenir un réseau entreprise', 6),
                              (7, 14.0, 'mémoire', '2023-02-18', 'Bien', 'developper un logiciel', 7),
                              (8, 16.8, 'soutenance', '2023-04-30', 'Très bien', 'faire un support technique', 8),
                              (9, 13.2, 'mémoire', '2023-08-14', 'Assez bien', 'créer une stratégie marketing', 9),
                              (10, 17.5, 'soutenance', '2023-10-22', 'Excellent', 'protéger des données sensibles', 10);


CREATE TABLE MISSION(
    id INT,
    keyword VARCHAR(50),
    job VARCHAR(50),
    comment VARCHAR(500),
    id_1 SMALLINT NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(id_1),
    FOREIGN KEY(id_1) REFERENCES USER(id)
);

INSERT INTO MISSION VALUES (1, 'html, css, js', 'developpeur web', 'developpeur pour notre nouveau site de cuisine', 1),
                           (2, 'Java', 'Ingénieur logiciel', 'Développement dune application Java', 2),
                              (3, 'sql, python', 'Data Analyst', 'Analyse des données de vente', 3),
                              (4, 'système', 'Administrateur système', 'Gestion des serveurs et de la sécurité', 4),
                              (5, 'concepteur', 'Designer UX/UI', 'Conception de linterface utilisateur pour une application mobile', 5),
                           (6, 'réseau', 'Ingénieur réseau', 'Configuration et maintenance du réseau dentreprise', 6),
                              (7, 'C#', 'Développeur logiciel', 'Développement dun logiciel de gestion des stocks', 7),
                           (8, 'technicien, support, informatique', 'Technicien support', 'Fournir un support technique aux utilisateurs', 8),
                           (9, 'marketing', 'Consultant en marketing', 'Conseil en stratégie marketing pour une entreprise cliente', 9),
                           (10, 'cybersécurité', 'Ingénieur en sécurité', 'Mise en place de mesures de sécurité pour protéger les données sensibles', 10);