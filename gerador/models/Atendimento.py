from models.Aluno import Aluno


class Atendimento:

    meses = {
        1: 'Janeiro',
        2: 'Fevereiro',
        3: 'Março',
        4: 'Abril',
        5: 'Maio',
        6: 'Junho',
        7: 'Julho',
        8: 'Agosto',
        9: 'Setembro',
        10: 'Outubro',
        11: 'Novembro',
        12: 'Dezembro'}

    horarios = {
        1: '07h30 - 08h20',
        2: '08h20 - 09h10',
        3: '09h20 - 10h10',
        4: '10h10 - 11h00',
        5: '11h00 - 11h50',
        6: '13h30 - 14h20',
        7: '14h20 - 15h10',
        8: '15h20 - 16h10',
        9: '16h10 - 17h00',
        10: '17h00 - 17h50',
        11: '18h10 - 19h00',
        12: '19h00 - 19h50',
        13: '19h50 - 20h40',
        14: '20h50 - 21h40',
        15: '21h40 - 22h30'
    }

    motivos = {
        0: 'Explicação de conteúdo da disciplina',
        1: 'Explicação de conteúdo de outra disciplina',
        2: 'Solução de exercícios (em geral)',
        3: 'Solução de exercícios para prova',
        4: 'Auxílio na preparação de material/experimentos para a disciplina'
    }

    def __init__(self):
        self.__id = ''
        self.__dia = ''
        self.__mes = 0
        self.__idMotivo = 0
        self.__motivo = ''
        self.__horario = 0
        self.__aluno = None

    def id(self, id):
        self.__id = id
        return self

    def getId(self):
        return self.__id

    def getDia(self):
        return self.__dia

    def getMes(self):
        return self.__mes()

    def getMotivo(self):
        return self.__motivo

    def printMotivo(self):
        print(self.__idMotivo)
        print(self.__motivo)

    def motivo(self, motivo):
        id = None
        try:
            id = int(motivo)
        except Exception as e:
            id = self.__nroMotivo(motivo)
        if id is not None:
            self.__idMotivo = id
            self.__motivo = Atendimento.motivos[self.__idMotivo]
        else:
            self.__idMotivo = 5
            self.__motivo = motivo

    def getHorario(self):
        return self.__horario()

    def getAluno(self):
        return self.__aluno

    def dia(self, dia):
        self.__dia = str(dia)
        return self

    def mes(self, mes):
        self.__mes = mes
        return self

    def mesFromNome(self, mes):
        self.__mes = self.__nroMes(mes)
        return self

    def horarioFromNome(self, horario):
        self.__horario = self.__nroHorario(horario)
        return self

    def horario(self, horario):
        self.__horario = horario
        return self

    def aluno(self, aluno):
        self.__aluno = aluno
        return self

    def __nroMes(self, mes):
        for key, value in Atendimento.meses.items():
            if mes == value:
                return key

    def __nroHorario(self, horario):
        for key, value in Atendimento.horarios.items():
            if horario == value:
                return key

    def __nroMotivo(self, motivo):
        for key, value in Atendimento.motivos.items():
            if motivo == value:
                return key

    def __mes(self):
        return Atendimento.meses[self.__mes]

    def __horarios(self):
        return horarios[self.__horario]

    def __str__(self):
        s = ''
        s += 'Horário: ' + Atendimento.horarios[self.__horario]
        s += '\nData: ' + self.__dia
        try:
            s += '/' + Atendimento.meses[self.__mes] + '\n'
        except Exception as e:
            s += '/0\n'
        s += 'Motivo: ' + self.getMotivo()
        if self.__aluno is not None:
            s += '\nAluno: ' + self.__aluno.getNome()
        s += '\n'
        return s

    def toJson(self):
        json = {}
        json['dia'] = self.getDia()
        json['mes'] = Atendimento.meses[self.__mes]
        json['motivo'] = self.getMotivo()
        if self.__aluno is not None:
            json['aluno'] = self.getAluno().getId()
        else:
            json['aluno'] = ''
        json['horario'] = Atendimento.horarios[int(self.__horario)]
        return json

    def copy(self):
        at = Atendimento()
        at.__id = self.__id
        at.__dia = self.__dia
        at.__mes = self.__mes
        at.__motivo = self.__motivo
        at.__horario = self.__horario
        at.__aluno = self.__aluno
        return at

    def __horarioToList(self):
        h = []
        for i in range(15):
            h.append('')
        if(self.__horario == 1):
            h[0] = 'X'
        elif(self.__horario < 15):
            h[self.__horario-1] = 'X'
            h[self.__horario] = 'X'
        else:
            pass
        return h

    def __motivoToList(self):
        m = []
        for i in range(7):
            m.append('')
        if(self.__idMotivo < 5):
            m[self.__idMotivo] = 'X'
        else:
            m[5] = 'X'
            m[6] = self.__motivo
        return m

    def toList(self):
        at = []
        at.append(Atendimento.meses[self.__mes])
        at.append(self.__dia)
        at.extend(self.__horarioToList())
        if self.__aluno is None:
            self.__aluno = Aluno()
        at.extend(self.__aluno.toList())
        at.append('Discord')
        at.extend(self.__motivoToList())
        return at

    def toCSV(self):
        s = ''
        separator = ';'
        s += self.__dia
        s += separator
        s += str(self.__horario)
        s += separator
        s += str(self.__idMotivo)
        s += separator
        if self.__aluno is not None:
            s += self.__aluno.getId()
        else:
            s += '-1'
        return s
