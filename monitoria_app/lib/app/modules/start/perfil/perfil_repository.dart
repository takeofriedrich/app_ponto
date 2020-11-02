import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:mobx/mobx.dart';
import 'package:monitoria_app/app/modules/start/perfil/models/perfi.dart';
import 'package:monitoria_app/app/shared/auth_controller.dart';

part 'perfil_repository.g.dart';

@Injectable()
class PerfilRepository extends Disposable {
  AuthController _authController = Modular.get<AuthController>();

  var collection = FirebaseFirestore.instance.collection('users');

  Future fetchPost(Function onUpdate) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(_authController.user.email)
        .snapshots()
        .listen(onUpdate);
  }

  void alterarPerfi(Perfil perfil) =>
      collection.doc(_authController.user.email).set(perfil.toJson());

  @override
  void dispose() {}
}
