class CursoInvalido(Exception):

    def __init__(self):
        super(CursoInvalido, self).__init__(
            'Acho que esse curso não é valido não!')
