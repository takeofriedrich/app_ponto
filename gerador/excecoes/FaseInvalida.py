class FaseInvalida(Exception):

    def __init__(self):
        super(FaseInvalida, self).__init__(
            'Acho que essa fase não é valida não!')
