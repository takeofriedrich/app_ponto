class ComandoInvalido(Exception):

    def __init__(self):
        super(ComandoInvalido, self).__init__(
            'Isso não me parece um comando válido, cheque a lista de comandos: https://github.com/takeofriedrich/botPy')
