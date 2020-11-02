import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from firebase_admin import firestore
from models.Aluno import Aluno
from models.Atendimento import Atendimento
from repository.Credenciais import Credenciais
from excecoes.IdInvalido import IdInvalido
from excecoes.ListaVazia import ListaVazia


class AlunoRepository:

    _instance = None
    _alunos = []

    def __init__(self):
        self.some_attribute = None

    def loadCache(self, email: str):
        _alunos = self.getAlunos(email)

    @classmethod
    def instance(cls):
        if cls._instance is None:
            cls._instance = cls()
        return cls._instance

    def getAlunos(self, email: str):
        alunos = []
        docs = Credenciais.instance().getDb().collection(
            u'alunos').document(u'{0}'.format(email)).get()
        if not docs.exists:
            raise ListaVazia()
        else:
            json = docs.to_dict()
            if(len(json.values()) > 0):
                for i in json:
                    a = Aluno()
                    a.fromJson(json[i], i)
                    alunos.append(a)
                _alunos = alunos
                return alunos
            else:
                raise ListaVazia()

    def procuraAlunosCache(self, id, email):
        for aluno in AlunoRepository._alunos:
            if(aluno.getId() == id):
                return aluno
        return self._procuraAluno(id, email)

    def _procuraAluno(self, id, email: str):
        if id is None or id == 'null':
            raise IdInvalido()
        else:
            alunos = self.getAlunos(email)
            for a in alunos:
                if(a.getId() == str(id)):
                    return a
            raise IdInvalido()
