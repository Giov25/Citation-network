-- Tabella Autori_Paper
CREATE TABLE Autori_Paper (
  ORCID VARCHAR(255) NOT NULL,
  DOI VARCHAR(255) NOT NULL,
  PRIMARY KEY (ORCID, DOI),
  FOREIGN KEY (ORCID) REFERENCES PhD_stud (ORCID) ON DELETE CASCADE,
  FOREIGN KEY (DOI) REFERENCES Paper (DOI) ON DELETE CASCADE

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
  tipo_venue VARCHAR(255), -- Journal, Conference, Workshop
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
-- INSERT INTO Paper (DOI, titolo, tipo_venue, abstract, bibtex, orcid_autore_principale) VALUES (
--   '10.1145/3746259.3760432',
--   'Continual Learning Strategies for Personalized Mental Well-being Monitoring from Mobile Sensing Data',
--   'Workshop',
--   'Automatic prediction of psychological stress using mobile sensing data is critical for developing personalized mental health monitoring tools. Traditional approaches typically train static models offline, limiting their applicability in real-world scenarios characterized by evolving user behaviors and data streams. To address these challenges, we formulate stress prediction as a continual learning (CL) regression task, where each user constitutes a distinct sequential task. Within this framework, we evaluate two adaptation strategies: (1) a replay-based approach, leveraging recurrent neural networks combined with an episodic memory buffer; and (2) a prompt-based method, where task-specific prompts are jointly trained with a transformer backbone and combined with the memory buffer to enable task-aware adaptation across users. Experiments conducted on a filtered subset of the StudentLife dataset, comprising multimodal behavioral and contextual data, demonstrate that prompt-based methods achieve competitive predictive performance. Our results underline the potential of continual learning paradigms to enable scalable and adaptive stress prediction systems.',
--   'ancora deve essere fornito',
--   '0009-0004-4055-3942'
-- );

