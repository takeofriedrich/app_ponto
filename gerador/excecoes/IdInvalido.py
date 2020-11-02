class IdInvalido(Exception):

    def __init__(self):
        super(IdInvalido, self).__init__(
            'Acho que você digitou um id inválido!')
