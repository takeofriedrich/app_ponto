class Aluno:

    def __init__(self):
        self.__id = ''
        self.__nome = ''
        self.__matricula = ''
        self.__email = ''
        self.__fase = ''
        self.__curso = ''

    def id(self, id):
        self.__id = id
        return self

    def getId(self):
        return self.__id

    def nome(self, nome):
        self.__nome = nome
        return self

    def matricula(self, matricula):
        self.__matricula = matricula
        return self

    def email(self, email):
        self.__email = email
        return self

    def curso(self, curso):
        self.__curso = curso
        return self

    def fase(self, fase):
        self.__fase = fase
        return self

    def getNome(self):
        return self.__nome

    def __str__(self):
        aluno = '('
        aluno += self.__id
        aluno += ') - '
        aluno += 'Nome: '
        aluno += self.__nome
        return aluno

    def getInfo(self):
        aluno = 'Nome: '
        aluno += self.__nome
        aluno += '\nMatricula: '
        aluno += self.__matricula
        aluno += '\nEmail: '
        aluno += self.__email
        aluno += '\nCurso: '
        aluno += self.__curso
        aluno += '\nFase: '
        aluno += self.__fase
        return aluno

    def toJson(self):
        json = {}
        json['nome'] = self.__nome
        json['matricula'] = self.__matricula
        json['email'] = self.__email
        json['curso'] = self.__curso
        json['fase'] = self.__fase
        return json

    def fromJson(self, json, id):
        if('nome' in json):
            self.__nome = json['nome']
        if('matricula' in json):
            self.__matricula = json['matricula']
        if('email' in json):
            self.__email = json['email']
        if('curso' in json):
            self.__curso = json['curso']
        if('fase' in json):
            self.__fase = json['fase']
        self.__id = id

    def copy(self):
        a = Aluno()
        a.nome(self.__nome)
        a.curso(self.__curso)
        a.email(self.__email)
        a.fase(self.__fase)
        a.id(self.__id)
        a.matricula(self.__matricula)
        return a

    def toList(self):
        aluno = []
        aluno.append(self.__nome)
        aluno.append(self.__matricula)
        aluno.append(self.__email)
        aluno.append(self.__curso)
        aluno.append(self.__fase)
        return list(aluno)
