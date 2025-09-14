import sqlite3
def inserisci_PhD_stud():
    try:
        # Si connette al database (crea il file se non esiste)
        conn = sqlite3.connect('citation_network.db')
        cursor = conn.cursor()

        print("--- Inserimento Nuovo PhD Student ---")
        orcid = input("ORCID: ")
        nome = input("Nome: ")
        cognome = input("Cognome: ")
        universita = input("Università: ")

        # Esegue la query di inserimento
        cursor.execute("""
            INSERT INTO PhD_stud (ORCID, nome, cognome, universita)
            VALUES (?, ?, ?, ?)
        """, (orcid, nome, cognome, universita))

        # Salva le modifiche
        conn.commit()
        print(f"\\nPhD Student '{nome} {cognome}' inserito con successo!")

    except sqlite3.Error as e:
        print(f"Errore del database: {e}")
    except ValueError:
        print("Errore: L'anno deve essere un numero.")
    finally:
        if conn:
            conn.close()
            
def aggiungi_paper():
    try:
        # Si connette al database (crea il file se non esiste)
        conn = sqlite3.connect('citation_network.db')
        cursor = conn.cursor()

        print("--- Inserimento Nuovo Paper ---")
        doi = input("DOI: ")
        titolo = input("Titolo: ")
        venue = input("Tipo di Venue (Journal, Conference, etc.): ")
        abstract = input("Abstract: ")
        bibtex = input("BibTeX: ")

        # Esegue la query di inserimento
        cursor.execute("""
            INSERT INTO Paper (DOI, titolo, tipo_venue, abstract, bibtex)
            VALUES (?, ?, ?, ?, ?)
        """, (doi, titolo, venue, abstract, bibtex))

        # Salva le modifiche
        conn.commit()
        print(f"\\nPaper '{titolo}' inserito con successo!")

    except sqlite3.Error as e:
        print(f"Errore del database: {e}")
    except ValueError:
        print("Errore: L'anno deve essere un numero.")
    finally:
        if conn:
            conn.close()

if __name__ == '__main__':
    print("Seleziona l'operazione da eseguire:")
    print("1. Inserisci un nuovo PhD Student")
    print("2. Aggiungi un nuovo Paper")
    scelta = input("Inserisci 1 o 2: ")

    if scelta == "1":
        inserisci_PhD_stud()
    elif scelta == "2":
        aggiungi_paper()
    else:
        print("Scelta non valida.")
