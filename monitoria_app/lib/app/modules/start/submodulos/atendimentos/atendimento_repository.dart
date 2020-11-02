import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:monitoria_app/app/modules/start/submodulos/atendimentos/models/atendimento.dart';
import 'package:monitoria_app/app/shared/auth_controller.dart';

part 'atendimento_repository.g.dart';

@Injectable()
class AtendimentoRepository extends Disposable {
  AuthController _controller = Modular.get<AuthController>();

  var colecao = FirebaseFirestore.instance.collection('atendimentos');

  AtendimentoRepository() {}

  Future fetchPost(Function onUpdate) async =>
      colecao.doc(_controller.user.email).snapshots().listen(onUpdate);

  removeAtendimento(int id, int mes) => colecao
      .doc(_controller.user.email)
      .update({'$mes\.$id': FieldValue.delete()});

  alterarAtendimento(Atendimento a, int mes) => colecao
      .doc(_controller.user.email)
      .update({'$mes\.${a.id}': a.toJsonUpdate()});

  Future novoAtendimento(Atendimento a, int mes) async {
    int id = await _newAtendimentoId();
    return colecao
        .doc(_controller.user.email)
        .update({'$mes\.$id': a.toJsonAdd()});
  }

  _newAtendimentoId() async {
    final idBd = FirebaseFirestore.instance
        .collection('users')
        .doc(_controller.user.email);
    DocumentSnapshot value = await idBd.get();
    if (value.data()['idAtendimento'] == null) {
      idBd.update({'idAtendimento': 1});
      return 0;
    } else {
      int id = value.data()['idAtendimento'];
      idBd.update({'idAtendimento': id + 1});
      return id;
    }
  }

  @override
  void dispose() {}
}
