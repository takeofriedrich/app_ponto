import firebase_admin
from excecoes.ListaVaziaT import ListaVaziaT
from firebase_admin import credentials, db, firestore
from models.Aluno import Aluno
from models.Atendimento import Atendimento

from repository.AlunoRepository import AlunoRepository
from repository.Credenciais import Credenciais


class AtendimentoRepository:

    _instance = None

    def __init__(self):
        self.some_attribute = None

    @classmethod
    def instance(cls):
        if cls._instance is None:
            cls._instance = cls()
        return cls._instance

    def getAtendimentos(self, email: str, mes: int):
        atendimentos = []
        docs = Credenciais.instance().getDb().collection(
            u'atendimentos').document(u'{0}'.format(email)).get()
        if not docs.exists:
            raise ListaVaziaT()
        else:
            json = dict(docs.to_dict())
            if(len(json.values()) > 0):
                AlunoRepository.instance().loadCache(email)
                for i in json[str(mes)]:
                    a = self.__atendimentoFromJson(
                        json[str(mes)][i], i, email, mes)
                    atendimentos.append(a)
                return atendimentos
            else:
                raise ListaVaziaT()

    def __atendimentoFromJson(self, json, id, email, mes):
        a = Atendimento()
        if('dia' in json):
            a.dia(json['dia'])
        if('motivo' in json):
            a.motivo(json['motivo'])
        if('aluno' in json):
            aluno = json['aluno']
            if aluno == -1:
                a.aluno(None)
            else:
                a.aluno(AlunoRepository.instance().procuraAlunosCache(
                    aluno, email))
        if('horario' in json):
            a.horario(json['horario'])
        a.id(id)
        a.mes(mes)
        return a

    def removeAtendimento(self, atendimento: Atendimento):
        monitor = ''
        Credenciais.instance().getDb().collection(u'{0}'.format(
            monitor.getCodigoDiscord())
        ).document(
            u'atendimentos').update({str(atendimento.getId()
                                         ): firestore.DELETE_FIELD})
