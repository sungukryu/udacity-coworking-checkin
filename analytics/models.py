# from sqlalchemy.ext.declarative import declarative_base
# from sqlalchemy.sql import func
# from sqlalchemy import Column, Integer, String, TIMESTAMP

# Base = declarative_base()


# class Token(Base):
#     __tablename__ = "tokens"
#     id = Column(Integer, primary_key=True)
#     user_id = Column(Integer, nullable=False)
#     token = Column(String(6), nullable=False)
#     created_at = Column(TIMESTAMP, nullable=False, default=func.now())
#     used_at = Column(TIMESTAMP)

#     def __repr__(self):
#         return f"<Token(id={self.id}, user_id={self.user_id}, token='{self.token}', created_at='{self.created_at}', used_at='{self.used_at}')>"

from datetime import datetime

from config import db


class User(db.Model):
    __tablename__ = "users"

    id = db.Column(db.Integer, primary_key=True)
    first_name = db.Column(db.String(50))
    last_name = db.Column(db.String(50))
    joined_at = db.Column(db.DateTime)
    is_active = db.Column(db.Boolean)


class Token(db.Model):
    __tablename__ = "tokens"

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, index=True, unique=False, nullable=False)
    token = db.Column(db.String(6), index=True, unique=False, nullable=False)
    created_at = db.Column(
        db.DateTime, index=False, unique=False, nullable=False, default=datetime.now()
    )
    used_at = db.Column(db.DateTime, index=True, unique=False, nullable=True)
