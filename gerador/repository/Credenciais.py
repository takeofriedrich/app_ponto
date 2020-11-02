import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from firebase_admin import firestore


class Credenciais:

    _instance = None

    def __init__(self):
        self.some_attribute = None
        cred = credentials.Certificate("assets/firebaseToken.json")
        firebase_admin.initialize_app(cred)
        self.__db = firestore.client()

    @classmethod
    def instance(cls):
        if cls._instance is None:
            cls._instance = cls()
        return cls._instance

    def getDb(self):
        return self.__db
