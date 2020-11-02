import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/models/aluno.dart';
import 'package:monitoria_app/app/shared/auth_controller.dart';

part 'alunos_repository.g.dart';

@Injectable()
class AlunosRepository extends Disposable {
  AuthController _controller = Modular.get<AuthController>();

  var colecao = FirebaseFirestore.instance.collection('alunos');

  Future fetchPost(Function onUpdate) async =>
      colecao.doc(_controller.user.email).snapshots().listen(onUpdate);

  removeAluno(int id) =>
      colecao.doc(_controller.user.email).update({'$id': FieldValue.delete()});

  alterarAluno(Aluno a) =>
      colecao.doc(_controller.user.email).update(a.toJsonUpdate());

  Future<Aluno> buscarAluno(String id) async {
    Aluno aluno;
    final resul = colecao
        .doc(_controller.user.email)
        .snapshots()
        .where((event) {
          return event.id == id;
        })
        .first
        .then((value) => aluno = Aluno.fromJson(id, value.data()));
    return aluno;
  }

  novoAluno(Aluno a) async {
    int id = await _newAlunoId();
    colecao.doc(_controller.user.email).update({'$id': a.toJsonAdd()});
  }

  _newAlunoId() async {
    final idBd = FirebaseFirestore.instance
        .collection('users')
        .doc(_controller.user.email);
    DocumentSnapshot value = await idBd.get();
    if (value.data()['idAluno'] == null) {
      idBd.update({'idAluno': 1});
      return 0;
    } else {
      int id = value.data()['idAluno'];
      idBd.update({'idAluno': id + 1});
      return id;
    }
  }

  @override
  void dispose() {}
}
