from fastapi import FastAPI, Form
import pymysql
from fastapi.middleware.cors import CORSMiddleware
from passlib.context import CryptContext

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

db = pymysql.connect(
    host="127.0.0.1",
    user="root",
    password="",
    database="smart_recipe_db"
)

def hash_password(password: str):
    return pwd_context.hash(password)

def verify_password(password: str, hashed: str):
    return pwd_context.verify(password, hashed)

@app.post("/register")
def register(name: str = Form(...), email: str = Form(...), password: str = Form(...)):
    cursor = db.cursor()
    cursor.execute("SELECT id FROM users WHERE email=%s", (email,))
    if cursor.fetchone():
        return {"success": False, "message": "Email déjà utilisé"}

    hashed = hash_password(password)
    cursor.execute(
        "INSERT INTO users (email, password) VALUES (%s, %s)",
        (email, hashed)
    )
    db.commit()
    return {"success": True, "message": "Compte créé avec succès"}

@app.post("/login")
def login(email: str = Form(...), password: str = Form(...)):
    cursor = db.cursor()
    cursor.execute("SELECT password FROM users WHERE email=%s", (email,))
    user = cursor.fetchone()
    if not user:
        return {"success": False, "message": "Utilisateur introuvable"}

    if verify_password(password, user[0]):
        return {"success": True, "message": "Connexion réussie"}
    return {"success": False, "message": "Mot de passe incorrect"}
