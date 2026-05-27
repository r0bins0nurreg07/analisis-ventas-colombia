from dotenv import load_dotenv
import os
from sqlalchemy import create_engine, text


load_dotenv()

DB_USER= os.getenv('DB_USER')
DB_PASSWORD= os.getenv('DB_PASSWORD')
DB_HOST= os.getenv('DB_HOST')
DB_PORT= os.getenv('DB_PORT')
DB_NAME= os.getenv('DB_NAME')

database_url = f"postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"

try:
    engine= create_engine(database_url )
    
    print("Conexión exitosa a la base de datos")

    with engine.begin() as connection:
        with open('sql/relate_table.sql', 'r', encoding='utf-8') as file:
            sql_script = file.read()
            connection.execute(text(sql_script))
            print("Tablas relacionadas  exitosamente")
except Exception as e:
    print(f"Error al conectar a la base de datos: {e}") 