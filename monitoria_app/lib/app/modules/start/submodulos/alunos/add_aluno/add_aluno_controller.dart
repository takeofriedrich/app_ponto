import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/alunos_repository.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/models/aluno.dart';

part 'add_aluno_controller.g.dart';

@Injectable()
class AddAlunoController = _AddAlunoControllerBase with _$AddAlunoController;

abstract class _AddAlunoControllerBase with Store {
  AlunosRepository repository = Modular.get<AlunosRepository>();

  @observable
  String nomeBotao = 'nome';

  @observable
  Aluno aluno = Aluno();

  final TextEditingController controllerNome = TextEditingController();
  final TextEditingController controllerMatricula = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerCurso = TextEditingController();

  @observable
  int fase = 1;

  void addFase() {
    fase < 10 ? fase++ : fase = 1;
  }

  void lessFase() {
    fase > 1 ? fase-- : fase = 10;
  }

  enterInfos(Aluno a) {
    controllerNome.text = a.nome;
    controllerCurso.text = a.curso;
    controllerEmail.text = a.email;
    controllerMatricula.text = a.matricula;
    fase = int.parse(a.fase);
    aluno.id = a.id;
  }

  _atualizarThisAluno() {
    aluno.nome = controllerNome.text;
    aluno.matricula = controllerMatricula.text;
    aluno.email = controllerEmail.text;
    aluno.fase = fase.toString();
    aluno.curso = controllerCurso.text;
  }

  atualizarAluno() {
    _atualizarThisAluno();
    repository.alterarAluno(this.aluno);
  }

  adicionarAluno() {
    _atualizarThisAluno();
    repository.novoAluno(this.aluno);
  }
}
