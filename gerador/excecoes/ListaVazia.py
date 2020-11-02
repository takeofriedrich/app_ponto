class ListaVazia(Exception):

    def __init__(self):
        super(ListaVazia, self).__init__(
            'Acho que você não possui nenhum aluno na sua lista!')
