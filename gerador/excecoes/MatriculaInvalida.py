class MatriculaInvalida(Exception):

    def __init__(self):
        super(MatriculaInvalida, self).__init__(
            'Acho que essa matricula não é valida não!')
