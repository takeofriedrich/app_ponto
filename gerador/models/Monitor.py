class Monitor:

    def __init__(self):
        self.__codigoDiscord = ''
        self.__orientador = ''
        self.__disciplina = ''
        self.__nome = ''

    def getCodigoDiscord(self):
        return self.__codigoDiscord

    def codigoDiscord(self, codigo):
        self.__codigoDiscord = codigo
        return self

    def orientador(self, orientador):
        self.__orientador = orientador
        return self

    def disciplina(self, disciplina):
        self.__disciplina = disciplina
        return self

    def nome(self, nome):
        self.__nome = nome
        return self

    def toJson(self):
        json = {}
        json['orientador'] = self.__orientador
        json['disciplina'] = self.__disciplina
        json['nome'] = self.__nome
        return json

    def __str__(self):
        s = ''
        s += 'Nome: ' + str(self.__nome)
        s += '\nDisciplina: ' + str(self.__disciplina)
        s += '\nOrientador: ' + str(self.__orientador)
        return s

    def getNome(self):
        return self.__nome

    def toList(self):
        monitor = []
        monitor.append(self.__disciplina)
        monitor.append(self.__orientador)
        return list(monitor)
