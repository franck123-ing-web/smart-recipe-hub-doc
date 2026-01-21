from fastapi import FastAPI, Form
import pymysql
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

# Autoriser le frontend à communiquer avec le backend
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Pour tests locaux
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Connexion MySQL (XAMPP)
db = pymysql.connect(
    host="127.0.0.1",   # ou "localhost"
    user="root",
    password="",         # mot de passe MySQL XAMPP
    database="smart_recipe_db"
)

@app.post("/login")
def login(email: str = Form(...), password: str = Form(...)):
    cursor = db.cursor()
    sql = "SELECT * FROM users WHERE email=%s AND password=%s"
    cursor.execute(sql, (email, password))
    user = cursor.fetchone()
    if user:
        return {"success": True, "message": "Connexion réussie !"}
    else:
        return {"success": False, "message": "Email ou mot de passe incorrect."}
