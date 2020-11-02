class EsqueceuParametros(Exception):

    def __init__(self):
        super(EsqueceuParametros, self).__init__(
            'Ops! Acho que você esqueceu de incluir algum parâmetro no comando!')
