from email.policy import default
from enum import unique
from multiprocessing import connection
from sqlite3 import connect
from click import echo
from requests import Session
from sqlalchemy.orm import declarative_base,sessionmaker
from sqlalchemy import Column,String,DateTime,Integer,create_engine
from datetime import datetime
import os

BASE_DIR = os.path.dirname(os.path.realpath(__file__))

connection_string="sqlite:///"+os.path.join(BASE_DIR,"site.db")

Base=declarative_base()

engine=create_engine(connection_string,echo=True)

Session=sessionmaker()

class MathsQuestions(Base):
    __tablename__ = "MathUQUESTIONS"
    id=Column(Integer(),primary_key=True)
    questions=Column(String(10000),nullable=False,unique=False)
    date_created=Column(DateTime(),default=datetime.utcnow)

    def __repr__(self):
        return f"<MathsQuestions Question={self.questions}"

new_sum = MathsQuestions(id=122,questions="x^2+5=905")
print(new_sum)