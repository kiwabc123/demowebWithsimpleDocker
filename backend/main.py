from fastapi import FastAPI
import pyodbc
import os
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

origins = [
    "http://localhost:3000",  # your frontend origin
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

def get_conn():
    return pyodbc.connect(
        f"DRIVER={{ODBC Driver 17 for SQL Server}};"
        f"SERVER={os.getenv('DB_SERVER')};"
        f"DATABASE={os.getenv('DB_DATABASE')};"
        f"UID={os.getenv('DB_UID')};"
        f"PWD={os.getenv('DB_PWD')}"
    )

@app.get("/datasets")
def get_datasets():
    try:
        conn = get_conn()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM datasets")
        columns = [column[0] for column in cursor.description]
        rows = cursor.fetchall()
        result = [dict(zip(columns, row)) for row in rows]
        cursor.close()
        conn.close()
        return result
    except Exception as e:
        return {"error": str(e)}
