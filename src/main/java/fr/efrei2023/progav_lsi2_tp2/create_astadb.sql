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
    diploma_year DATE,
    major VARCHAR(50),
    PRIMARY KEY(id)
);

CREATE TABLE COMPANY(
    id INT,
    name VARCHAR(50),
    address VARCHAR(50),
    access_info VARCHAR(50),
    PRIMARY KEY(id)
);

CREATE TABLE USER(
    id SMALLINT,
    last_name VARCHAR(50),
    first_name VARCHAR(50),
    phone VARCHAR(50),
    mail VARCHAR(50),
    type VARCHAR(50),
    id_1 INT NOT NULL,
    id_2 INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_1) REFERENCES COMPANY(id),
    FOREIGN KEY(id_2) REFERENCES PROGRAM(id)
);

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

INSERT INTO EVALUATION VALUES (1, 16.0, 'mémoire', '2023-01-15', 'Très bien', 'création d\'un site', 1),
                              (2, 14.5, 'soutenance', '2023-03-10', 'Bien', 'nouvelle application', 2),
                              (3, 17.2, 'mémoire', '2023-05-20', 'Excellent', 'gérer une base de données', 3),
                              (4, 13.8, 'soutenance', '2023-07-05', 'Assez bien', 'sécurisation d\'un serveur', 4),
                              (5, 15.7, 'mémoire', '2023-09-12', 'Très satisfaisant', 'design d\' une nouvelle interface client', 5),
                              (6, 18.3, 'soutenance', '2023-11-08', 'Très bien', 'comment maintenir un réseau entreprise', 6),
                              (7, 14.0, 'mémoire', '2023-02-18', 'Bien', 'developper un logiciel', 7),
                              (8, 16.8, 'soutenance', '2023-04-30', 'Très bien', 'faire un support technique', 8),
                              (9, 13.2, 'mémoire', '2023-08-14', 'Assez bien', 'créer une stratégie marketing', 9),
                              (10, 17.5, 'soutenance', '2023-10-22', 'Excellent', 'protéger des données sensibles', 10);


CREATE TABLE MISSION(
    id INT,
    keyword VARCHAR(50),
    job VARCHAR(50),
    comment VARCHAR(50),
    id_1 SMALLINT NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(id_1),
    FOREIGN KEY(id_1) REFERENCES USER(id)
);

INSERT INTO MISSION VALUES (1, 'html, css, js', 'developpeur web', 'developpeur pour notre nouveau site de cuisine', 1),
                           (2, 'Java', 'Ingénieur logiciel', 'Développement d\'une application Java', 2),
                           (3, 'sql, python', 'Data Analyst', 'Analyse des données de vente', 3),
                           (4, 'système', 'Administrateur système', 'Gestion des serveurs et de la sécurité', 4),
                           (5, 'concepteur', 'Designer UX/UI', 'Conception de l\'interface utilisateur pour une application mobile', 5),
                           (6, 'réseau', 'Ingénieur réseau', 'Configuration et maintenance du réseau d\'entreprise', 6),
                           (7, 'C#', 'Développeur logiciel', 'Développement d\'un logiciel de gestion des stocks', 7),
                           (8, 'technicien, support, informatique', 'Technicien support', 'Fournir un support technique aux utilisateurs', 8),
                           (9, 'marketing', 'Consultant en marketing', 'Conseil en stratégie marketing pour une entreprise cliente', 9),
                           (10, 'cybersécurité', 'Ingénieur en sécurité', 'Mise en place de mesures de sécurité pour protéger les données sensibles', 10);