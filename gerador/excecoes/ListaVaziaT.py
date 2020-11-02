class ListaVaziaT(Exception):

    def __init__(self):
        super(ListaVaziaT, self).__init__(
            'Acho que você não possui nenhum atendimento na sua lista!')
