class NomeInvalido(Exception):

    def __init__(self):
        super(NomeInvalido, self).__init__(
            'Acho que esse nome não é valido não!')
