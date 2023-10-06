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
