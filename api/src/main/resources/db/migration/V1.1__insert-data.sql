-- Insérer des types d'établissement
INSERT INTO type_etablissement (id_type, nom_type) VALUES
                                                       (1, 'Lycée'),
                                                       (2, 'Collège');

-- Insérer des établissements
INSERT INTO etablissement (id_etablissement, nom_etablissement, ville_etablissement, departement_etablissement, email_contact, nom_proviseur, prenom_proviseur, civilite_proviseur, id_type) VALUES
                                                                                                                                                                                                 (1, 'Lycée Victor Hugo', 'Paris', 'Paris', 'contact@victorhugo.com', 'Dupont', 'Jean', 'Monsieur', 1),
                                                                                                                                                                                                 (2, 'Collège Jules Ferry', 'Lyon', 'Rhône', 'contact@julesferry.com', 'Martin', 'Claire', 'Madame', 2);

-- Insérer des utilisateurs
INSERT INTO users (id_user, nom_user, email_user, password, role, id_etablissement) VALUES
                                                                                        (1, 'admin1', 'admin1@victorhugo.com', 'password1', 'ADMIN', 1),
                                                                                        (2, 'admin2', 'admin2@julesferry.com', 'password2', 'ADMIN', 2);

-- Insérer des filières d'immersion
INSERT INTO filiere_immersion (id_filiere, nom_filiere) VALUES
                                                            (1, 'Sciences'),
                                                            (2, 'Lettres'),
                                                            (3, 'Mathématiques');

-- Insérer des classes
INSERT INTO classe (id_classe, nom_classe) VALUES
                                               (1, 'Seconde A'),
                                               (2, 'Première B');

-- Insérer des salles
INSERT INTO salle (id_salle, numero_salle) VALUES
                                               (1, '101'),
                                               (2, '202');

-- Insérer des enseignants
INSERT INTO enseignant (id_enseignant, nom, civilite) VALUES
                                                          (1, 'Durand', 'Monsieur'),
                                                          (2, 'Leclerc', 'Madame');

-- Insérer des élèves
INSERT INTO eleve (id_eleve, nom_eleve, prenom_eleve, date_naissance, regime_scolaire, id_classe, id_etablissement) VALUES
                                                                                                                        (1, 'Bernard', 'Luc', '2006-05-12', 'Interne', 1, 1),
                                                                                                                        (2, 'Petit', 'Marie', '2007-03-22', 'Externe', 2, 2);

-- Insérer des sessions d'immersion
INSERT INTO session_immersion (id_session, is_active, description, nombre_de_place, date_session, heure_debut, heure_fin, id_enseignant, id_salle, id_filiere) VALUES
                                                                                                                                                                   (1, true, 'Session Sciences', 30, '2025-03-01', '2025-03-01 09:00:00', '2025-03-01 12:00:00', 1, 1, 1),
                                                                                                                                                                   (2, false, 'Session Lettres', 20, '2025-03-02', '2025-03-02 14:00:00', '2025-03-02 17:00:00', 2, 2, 2);

-- Insérer des inscriptions
INSERT INTO inscription (id_inscription, statut, date_inscription, signature_proviseur_accueil, signature_proviseur_origine, signature_parents, id_eleve, id_session) VALUES
                                                                                                                                                                          (1, 'Validée', '2025-02-15', true, true, true, 1, 1),
                                                                                                                                                                          (2, 'En attente', '2025-02-16', false, true, true, 2, 2);
