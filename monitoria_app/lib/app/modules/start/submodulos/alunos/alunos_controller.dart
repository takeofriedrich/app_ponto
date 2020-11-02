import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/alunos_repository.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/models/aluno.dart';

part 'alunos_controller.g.dart';

@Injectable()
class AlunosController = _AlunosControllerBase with _$AlunosController;

abstract class _AlunosControllerBase with Store {
  @observable
  Map<String, Aluno> als = {};

  _AlunosControllerBase() {
    Modular.get<AlunosRepository>().fetchPost(onUpdate);
  }

  @action
  void onUpdate(DocumentSnapshot event) {
    als = {};
    if (event.data() != null) {
      event
          .data()
          .forEach((key, value) => als[key] = Aluno.fromJson(key, value));
    }
  }
}
