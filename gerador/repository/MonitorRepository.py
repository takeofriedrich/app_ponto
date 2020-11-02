import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from firebase_admin import firestore
from models.Monitor import Monitor
from repository.Credenciais import Credenciais


class MonitorRepository:

    _instance = None

    def __init__(self):
        self.some_attribute = None

    @classmethod
    def instance(cls):
        if cls._instance is None:
            cls._instance = cls()
        return cls._instance

    def getMonitor(self, email: str):
        docs = Credenciais.instance().getDb().collection(
            u'users').document(u'{0}'.format(email)).get()
        if not docs.exists:
            raise Exception('Monitor não encontrado')
        else:
            json = docs.to_dict()
            if(len(json.values()) > 0):
                return Monitor().disciplina(
                    (json['disciplina'])).orientador(json['orientador']
                                                     ).nome(json['nome'])
