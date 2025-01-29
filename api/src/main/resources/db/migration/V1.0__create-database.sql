CREATE TABLE `employees` (
                             `id` bigint NOT NULL AUTO_INCREMENT,
                             `first_name` varchar(255) DEFAULT NULL,
                             `last_name` varchar(255) DEFAULT NULL,
                             `mail` varchar(255) DEFAULT NULL,
                             `password` varchar(255) DEFAULT NULL,
                             `test` varchar(255) DEFAULT NULL,
                             PRIMARY KEY (`id`)
);

CREATE TABLE type_etablissement(
                                   id_type INT,
                                   nom_type VARCHAR(50),
                                   PRIMARY KEY(id_type)
);

CREATE TABLE etablissement(
                              id_etablissement INT,
                              nom_etablissement VARCHAR(50),
                              ville_etablissement VARCHAR(50),
                              departement_etablissement VARCHAR(50),
                              email_contact VARCHAR(50),
                              nom_proviseur VARCHAR(50),
                              prenom_proviseur VARCHAR(50),
                              civilite_proviseur VARCHAR(50),
                              id_type INT NOT NULL,
                              PRIMARY KEY(id_etablissement),
                              FOREIGN KEY(id_type) REFERENCES type_etablissement(id_type)
);

CREATE TABLE users(
                      id_user INT,
                      nom_user VARCHAR(50),
                      email_user VARCHAR(50),
                      password VARCHAR(50),
                      role VARCHAR(50),
                      id_etablissement INT NOT NULL,
                      PRIMARY KEY(id_user),
                      FOREIGN KEY(id_etablissement) REFERENCES etablissement(id_etablissement)
);

CREATE TABLE filiere_immersion(
                                  id_filiere INT,
                                  nom_filiere VARCHAR(50),
                                  PRIMARY KEY(id_filiere)
);

CREATE TABLE classe(
                       id_classe INT,
                       nom_classe VARCHAR(50),
                       PRIMARY KEY(id_classe)
);

CREATE TABLE salle(
                      id_salle INT,
                      numero_salle VARCHAR(50),
                      PRIMARY KEY(id_salle)
);

CREATE TABLE enseignant(
                           id_enseignant INT,
                           nom VARCHAR(50),
                           civilite VARCHAR(50),
                           PRIMARY KEY(id_enseignant)
);

CREATE TABLE eleve(
                      id_eleve INT,
                      nom_eleve VARCHAR(50),
                      prenom_eleve VARCHAR(50),
                      date_naissance DATE,
                      regime_scolaire VARCHAR(50),
                      id_classe INT NOT NULL,
                      id_etablissement INT NOT NULL,
                      PRIMARY KEY(id_eleve),
                      FOREIGN KEY(id_classe) REFERENCES classe(id_classe),
                      FOREIGN KEY(id_etablissement) REFERENCES etablissement(id_etablissement)
);

CREATE TABLE session_immersion(
                                  id_session INT,
                                  is_active BOOLEAN,
                                  description VARCHAR(50),
                                  nombre_de_place INT,
                                  date_session DATE,
                                  heure_debut DATETIME,
                                  heure_fin DATETIME,
                                  id_enseignant INT NOT NULL,
                                  id_salle INT NOT NULL,
                                  id_filiere INT NOT NULL,
                                  PRIMARY KEY(id_session),
                                  FOREIGN KEY(id_enseignant) REFERENCES enseignant(id_enseignant),
                                  FOREIGN KEY(id_salle) REFERENCES salle(id_salle),
                                  FOREIGN KEY(id_filiere) REFERENCES filiere_immersion(id_filiere)
);

CREATE TABLE inscription(
                            id_inscription INT,
                            statut VARCHAR(50),
                            date_inscription DATE,
                            signature_proviseur_accueil BOOLEAN,
                            signature_proviseur_origine BOOLEAN,
                            signature_parents BOOLEAN,
                            id_eleve INT NOT NULL,
                            id_session INT NOT NULL,
                            PRIMARY KEY(id_inscription),
                            UNIQUE(id_eleve),
                            FOREIGN KEY(id_eleve) REFERENCES eleve(id_eleve),
                            FOREIGN KEY(id_session) REFERENCES session_immersion(id_session)
);
