-- Tabella Autori_Paper
CREATE TABLE Autori_Paper (
  ORCID VARCHAR(255) NOT NULL,
  DOI VARCHAR(255) NOT NULL,
  PRIMARY KEY (ORCID, DOI),
  FOREIGN KEY (ORCID) REFERENCES PhD_stud (ORCID),
  FOREIGN KEY (DOI) REFERENCES Paper (DOI)
);

-- Tabella Cita
CREATE TABLE Cita (
  id_citazione INTEGER PRIMARY KEY AUTOINCREMENT,
  DOI_paper_citante VARCHAR(255),
  DOI_paper_citato VARCHAR(255),
  FOREIGN KEY (DOI_paper_citante) REFERENCES Paper (DOI),
  FOREIGN KEY (DOI_paper_citato) REFERENCES Paper (DOI)
);

-- Tabella Paper
CREATE TABLE Paper (
  DOI VARCHAR(255) PRIMARY KEY,
  titolo VARCHAR(255) NOT NULL,
  abstract TEXT,
  bibtex TEXT,
  orcid_autore_principale VARCHAR(255),
  FOREIGN KEY (orcid_autore_principale) REFERENCES PhD_stud (ORCID)
);

-- Tabella Studenti
CREATE TABLE PhD_stud (
  ORCID VARCHAR(255) PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  cognome VARCHAR(255) NOT NULL,
  universita VARCHAR(255)
);

-- Inserimento del tuo studente
INSERT INTO PhD_stud (ORCID, nome, cognome, universita) VALUES
('0009-0004-4055-3942','Giovanni','Patanè','UNICT');
INSERT INTO PhD_stud (ORCID, nome, cognome, universita) VALUES
('0009-0006-2760-9889','Rosario','Napoli','UNIME');
INSERT INTO PhD_stud (ORCID, nome, cognome, universita) VALUES
('0009-0009-6980-2160','Marialuisa','Lusito','Federico II');