import sqlite3
import pandas as pd

DB_FILE = "citation_network.db"

# Impostiamo pandas per mostrare tutte le colonne
pd.set_option('display.max_columns', None)
pd.set_option('display.width', 120) # Aumenta la larghezza della tabella in console

try:
    conn = sqlite3.connect(DB_FILE)

    # La query SQL che vuoi eseguire
    query = "SELECT * FROM Paper"

    # pd.read_sql_query esegue la query e carica i risultati in un DataFrame
    df_papers = pd.read_sql_query(query, conn)

    print("--- Tabella Paper (visualizzata con pandas) ---")
    print(df_papers)


    # Esempio più complesso: Unire Paper e Autori per vedere chi ha scritto cosa
    query_autori = """
    SELECT
        p.titolo,
        p.anno_pubblicazione,
        d.nome,
        d.cognome
    FROM Paper p
    JOIN Autori_Paper ap ON p.DOI = ap.DOI
    JOIN PhD_stud d ON ap.ORCID = d.ORCID
    ORDER BY p.anno_pubblicazione DESC;
    """

    df_autori = pd.read_sql_query(query_autori, conn)
    print("\\n--- Paper con i rispettivi Autori ---")
    print(df_autori)


except sqlite3.Error as e:
    print(f"Errore del database: {e}")
finally:
    if conn:
        conn.close()