from fastapi import FastAPI, Form
import secrets
import pymysql
from fastapi.middleware.cors import CORSMiddleware
from passlib.context import CryptContext
from datetime import datetime, timedelta

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
        "INSERT INTO users (name, email, password) VALUES (%s, %s, %s)",
        (name, email, hashed)
    )
    db.commit()
    return {"success": True, "message": "Compte créé avec succès"}



@app.post("/login")
def login(email: str = Form(...), password: str = Form(...)):
    cursor = db.cursor()
    cursor.execute("SELECT id, password, email FROM users WHERE email=%s", (email,))
    user = cursor.fetchone()
    if not user:
        return {"success": False, "message": "Utilisateur introuvable"}

    user_id, hashed_pwd, email_db = user
    if verify_password(password, hashed_pwd):
        return {"success": True, "message": "Connexion réussie", "user_id": user_id, "email": email_db}
    return {"success": False, "message": "Mot de passe incorrect"}


@app.post("/forgot")
def forgot(email: str = Form(...)):
    cursor = db.cursor()
    cursor.execute("SELECT id FROM users WHERE email=%s", (email,))
    user = cursor.fetchone()
    if not user:
        return {"success": False, "message": "Email introuvable"}

    token = secrets.token_urlsafe(32)
    expires = datetime.now() + timedelta(minutes=15)

    cursor.execute(
        "UPDATE users SET reset_token=%s, reset_expires=%s WHERE email=%s",
        (token, expires, email)
    )
    db.commit()

    return {
        "success": True,
        "reset_link": f"http://localhost:3000/reset.html?token={token}"
    }
@app.post("/reset")
def reset(token: str = Form(...), password: str = Form(...)):
    cursor = db.cursor()
    cursor.execute(
        "SELECT id FROM users WHERE reset_token=%s AND reset_expires > NOW()",
        (token,)
    )
    user = cursor.fetchone()
    if not user:
        return {"success": False, "message": "Lien invalide ou expiré"}

    hashed = hash_password(password)
    cursor.execute(
        "UPDATE users SET password=%s, reset_token=NULL, reset_expires=NULL WHERE reset_token=%s",
        (hashed, token)
    )
    db.commit()

    return {"success": True, "message": "Mot de passe mis à jour"}
# GET toutes les recettes d'un utilisateur
@app.get("/recipes/{user_id}")
def get_recipes(user_id: int):
    cursor = db.cursor(pymysql.cursors.DictCursor)
    cursor.execute("""
        SELECT * FROM recipes
        WHERE user_id = %s OR is_global = 1
        ORDER BY created_at DESC
    """, (user_id,))
    recipes = cursor.fetchall()
    return {"success": True, "recipes": recipes}




# POST ajouter recette
@app.post("/recipes/add")
def add_recipe(user_id: int = Form(...), title: str = Form(...), description: str = Form(...), image_url: str = Form(...)):
    cursor = db.cursor()
    cursor.execute(
        "INSERT INTO recipes (user_id, title, description, image_url) VALUES (%s,%s,%s,%s)",
        (user_id, title, description, image_url)
    )
    db.commit()
    return {"success": True, "message": "Recette ajoutée !"}

# POST modifier recette
@app.post("/recipes/update")
def update_recipe(recipe_id: int = Form(...), title: str = Form(...), description: str = Form(...), image_url: str = Form(...)):
    cursor = db.cursor()
    cursor.execute(
        "UPDATE recipes SET title=%s, description=%s, image_url=%s WHERE id=%s",
        (title, description, image_url, recipe_id)
    )
    db.commit()
    return {"success": True, "message": "Recette modifiée !"}

# POST supprimer recette
@app.post("/recipes/delete")
def delete_recipe(recipe_id: int = Form(...)):
    cursor = db.cursor()
    cursor.execute("DELETE FROM recipes WHERE id=%s", (recipe_id,))
    db.commit()
    return {"success": True, "message": "Recette supprimée !"}
