import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monitoria_app/app/shared/auth_controller.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  bool loading = false;

  final auth = Modular.get<AuthController>();

  login() =>
      auth.loginWithGoogle().then((value) => Modular.to.pushNamed('/start'));
}
