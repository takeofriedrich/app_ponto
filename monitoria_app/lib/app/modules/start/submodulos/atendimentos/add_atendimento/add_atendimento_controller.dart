import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/alunos_controller.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/models/aluno.dart';
import 'package:monitoria_app/app/modules/start/submodulos/atendimentos/atendimento_repository.dart';
import 'package:monitoria_app/app/modules/start/submodulos/atendimentos/models/atendimento.dart';

part 'add_atendimento_controller.g.dart';

@Injectable()
class AddAtendimentoController = _AddAtendimentoControllerBase
    with _$AddAtendimentoController;

abstract class _AddAtendimentoControllerBase with Store {
  final AlunosController _alunosController = Modular.get<AlunosController>();

  AtendimentoRepository _repository = Modular.get<AtendimentoRepository>();

  _AddAtendimentoControllerBase() {
    _alunosController.als.values.length > 0
        ? aluno = _alunosController.als.values.first
        : Aluno();
  }

  int id;

  @observable
  int horario = 1;

  @observable
  int mes = DateTime.now().month;

  @observable
  int dia = DateTime.now().day;

  @observable
  int motivo = 0;

  @observable
  int alunoIndex = 0;

  @observable
  Aluno aluno;

  @observable
  bool comAluno = true;

  @action
  changeStates(Atendimento atendimento, int mes) {
    this.id = atendimento.id;
    horario = atendimento.horario;
    this.mes = mes;
    dia = atendimento.dia;
    motivo = atendimento.motivo;
    final alunos = _alunosController.als.values.toList();
    for (int i = 0; i < alunos.length; i++) {
      alunos[i].id == atendimento.id_aluno ? alunoIndex = i : null;
    }
    atendimento.id_aluno != -1 ? comAluno = false : comAluno = true;
  }

  @action
  incrementHorario() => horario < 15 ? horario++ : horario = 1;

  @action
  decrementHorario() => horario > 1 ? horario-- : horario = 15;

  @action
  incrementDia() => dia < 31 ? dia++ : dia = 1;

  @action
  decrementDia() => dia > 1 ? dia-- : dia = 31;

  @action
  incrementMes() => mes < 12 ? mes++ : mes = 1;

  @action
  decrementMes() => mes > 1 ? mes-- : mes = 12;

  @action
  incrementaMotivo() => motivo < 4 ? motivo++ : motivo = 0;

  @action
  decrementaMotivo() => motivo > 1 ? motivo-- : motivo = 4;

  get alunos => _alunosController.als.values.toList();

  @action
  nextAluno() {
    alunoIndex < _alunosController.als.length - 1
        ? alunoIndex++
        : alunoIndex = 0;
    aluno = _alunosController.als.values.toList().elementAt(alunoIndex);
  }

  @action
  previouslyAluno() {
    alunoIndex > 0
        ? alunoIndex--
        : alunoIndex = _alunosController.als.length - 1;
    aluno = _alunosController.als.values.toList().elementAt(alunoIndex);
  }

  @action
  trocaAluno() => comAluno ? comAluno = false : comAluno = true;

  Future adicionarAtendimento() async {
    Atendimento novo = Atendimento.withData(dia, horario, motivo, -1);
    if (!comAluno) novo.id_aluno = aluno.id;
    return _repository.novoAtendimento(novo, mes);
  }

  Future editarAtendimento(int id) {
    Atendimento novo = Atendimento.withData(dia, horario, motivo, id);
    if (!comAluno) novo.id_aluno = aluno.id;
    return _repository.alterarAtendimento(novo, mes);
  }
}

enum AddPageTitle { adicionar, editar }
