import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/alunos_controller.dart';
import 'package:monitoria_app/app/modules/start/submodulos/atendimentos/atendimento_repository.dart';
import 'package:monitoria_app/app/modules/start/submodulos/atendimentos/models/atendimento.dart';

part 'atendimentos_controller.g.dart';

@Injectable()
class AtendimentosController = _AtendimentosControllerBase
    with _$AtendimentosController;

abstract class _AtendimentosControllerBase with Store {
  AtendimentoRepository _atendimentoRepository =
      Modular.get<AtendimentoRepository>();
  AlunosController _alunosController = Modular.get<AlunosController>();

  @observable
  Map<int, List<Atendimento>> atendimentos = {
    1: [],
    2: [],
    3: [],
    4: [],
    5: [],
    6: [],
    7: [],
    8: [],
    9: [],
    10: [],
    11: [],
    12: []
  };

  @observable
  int mes = DateTime.now().month;

  _AtendimentosControllerBase() {
    _atendimentoRepository.fetchPost(onUpdate);
  }

  onUpdate(event) {
    if (event.data() != null) {
      Map<int, List<Atendimento>> atendimentos = {
        1: [],
        2: [],
        3: [],
        4: [],
        5: [],
        6: [],
        7: [],
        8: [],
        9: [],
        10: [],
        11: [],
        12: []
      };
      event.data().forEach(
        (mes, atendimento) {
          List<Atendimento> ats = [];
          atendimento.forEach((id, at) async {
            ats.add(Atendimento.fromJson(id, at));
          });
          atendimentos[int.parse(mes)] = ats;
        },
      );
      this.atendimentos = atendimentos;
    }
  }

  @action
  botaoDireita() => mes < 12 ? mes++ : mes = 1;

  @action
  botaoEsquerda() => mes > 1 ? mes-- : mes = 12;
}
