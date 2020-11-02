class SemOrientador(Exception):

    def __init__(self):
        super(SemOrientador, self).__init__(
            'Parece que você ainda não definiu seu orientador ou sua disciplina!')
