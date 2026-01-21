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

@app.post("/register")
def register(name: str = Form(...), email: str = Form(...), password: str = Form(...)):
    cursor = db.cursor()

    # Vérifier si l'email existe
    cursor.execute("SELECT id FROM users WHERE email=%s", (email,))
    if cursor.fetchone():
        return {"success": False, "message": "Email déjà utilisé"}

    sql = "INSERT INTO users (email, password) VALUES (%s, %s)"
    cursor.execute(sql, (email, password))
    db.commit()

    return {"success": True, "message": "Compte créé avec succès"}
