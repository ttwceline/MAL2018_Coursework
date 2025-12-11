from config import app, db
from models import Users, Trail, TrailLocationPoint
# Data from Assignment
REQUIRED_USERS = [
    {
        "user_id": 1, 
        "username": "Ada Lovelace", 
        "email": "grace@plymouth.ac.uk", 
        "role": "user" 
    },
    {
        "user_id": 2, 
        "username": "Tim Berners-Lee", 
        "email": "tim@plymouth.ac.uk", 
        "role": "admin"
    },
    {
        "user_id": 3, 
        "username": "Ada Lovelace", 
        "email": "ada@plymouth.ac.uk", 
        "role": "admin"
    }
]

with app.app_context():
    print("WARNING: This will delete all existing data.")
    
    # 1. Delete old tables
    db.drop_all()
    print("Old tables dropped.")

    # 2. Create new tables
    db.create_all()
    print("New tables created.")

    # 3. Insert the required users
    print("Seeding Users...")
    for data in REQUIRED_USERS:
        new_user = Users(
            user_id=data["user_id"],
            username=data["username"],
            email=data["email"],
            role=data["role"]
        )
        db.session.add(new_user)
        print(f" -> Added: {data['username']} ({data['email']})")

    # 4. Save changes
    db.session.commit()
    print("Database reset and seeded successfully!")
