from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import pyodbc
import os

app = FastAPI()

# CORS setup
origins = [
    "http://localhost:3000",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Global connection object
conn = None

@app.on_event("startup")
def startup():
    global conn
    try:
        conn = pyodbc.connect(
            f"DRIVER={{ODBC Driver 17 for SQL Server}};"
            f"SERVER={os.getenv('DB_SERVER')};"
            f"DATABASE={os.getenv('DB_DATABASE')};"
            f"UID={os.getenv('DB_UID')};"
            f"PWD={os.getenv('DB_PWD')};"
        )
        print("✅ Database connection established.")
    except Exception as e:
        print("❌ Failed to connect to database:", str(e))


@app.on_event("shutdown")
def shutdown():
    global conn
    if conn:
        conn.close()
        print("🔌 Database connection closed.")

@app.get("/datasets")
def get_datasets():
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM datasets")
        columns = [column[0] for column in cursor.description]
        rows = cursor.fetchall()
        cursor.close()
        return [dict(zip(columns, row)) for row in rows]
    except Exception as e:
        return {"error": str(e)}
