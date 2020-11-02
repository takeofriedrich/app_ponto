class EmailInvalido(Exception):

    def __init__(self):
        super(EmailInvalido, self).__init__(
            'Acho que esse email não é valido não!')
