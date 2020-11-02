import pandas as pd
from openpyxl import load_workbook
from repository.AtendimentoRepository import AtendimentoRepository
from repository.MonitorRepository import MonitorRepository
import shutil


class GeradorP:

    modelo = 'assets/modelo.xlsx'

    def __init__(self):
        pass

    def geraPlanilha(self, email: str, mes: int):

        atsOld = AtendimentoRepository.instance().getAtendimentos(email, mes)
        ats = sorted(atsOld, key=lambda x: int(x.getDia()), reverse=False)
        lista = []

        mon = []
        monitor = MonitorRepository.instance().getMonitor(email)
        mon.append(monitor.getNome())

        for i in range(32):
            mon.append('')
        lista.append(mon)

        for i in ats:
            aux = []
            aux.append('')
            aux.extend(monitor.toList())
            aux.extend(i.toList())
            lista.append(aux)

        df = pd.DataFrame(lista)

        target = u'{0}'.format(email+'.xlsx')

        shutil.copyfile(GeradorP.modelo, target)
        writer = pd.ExcelWriter(target, engine='openpyxl')
        writer.book = load_workbook(target)
        writer.sheets = dict((ws.title, ws) for ws in writer.book.worksheets)
        reader = pd.read_excel(target)
        df.to_excel(writer, index=False, header=False, startrow=len(
            reader)+1, sheet_name='Planilha Monitoria 2020-1')
        writer.close()

    def gerarCSVMes(self, email, mes):
        atsOld = AtendimentoRepository.instance().getAtendimentos(email, mes)
        ats = sorted(atsOld, key=lambda x: int(x.getDia()), reverse=False)
        f = open(str(mes)+'_'+str(email)+'.csv', 'w')
        f.write('Dia;Horário;Motivo;Aluno\n')
        for at in ats:
            f.write(at.toCSV()+'\n')
