import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monitoria_app/app/modules/start/perfil/models/perfi.dart';
import 'package:monitoria_app/app/modules/start/perfil/perfil_repository.dart';
import 'package:monitoria_app/app/shared/auth_controller.dart';

import '../../../app_controller.dart';
import '../../../app_controller.dart';

part 'perfil_controller.g.dart';

@Injectable()
class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  @observable
  String nomeBotao = 'nome';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AuthController _authController = Modular.get<AuthController>();

  @observable
  Perfil perfil = Perfil();

  final TextEditingController controllerTexto = TextEditingController();

  PerfilRepository repository = Modular.get<PerfilRepository>();

  _PerfilControllerBase() {
    repository.fetchPost(cadastrarObservador);
  }

  @action
  cadastrarObservador(json) => perfil = Perfil.fromJson(json.data());

  @action
  atualizarPerfil() => repository.alterarPerfi(perfil);

  alterarEValidar() {
    if (formKey.currentState.validate()) {
      switch (nomeBotao) {
        case 'nome':
          perfil.nome = controllerTexto.text;
          break;
        case 'disciplina':
          perfil.disciplina = controllerTexto.text;
          break;
        case 'orientador':
          perfil.orientador = controllerTexto.text;
          break;
      }
      atualizarPerfil();
    }
  }

  void switchToNome() {
    nomeBotao = 'nome';
    controllerTexto.text = perfil.nome;
  }

  void switchToDisciplina() {
    nomeBotao = 'disciplina';
    controllerTexto.text = perfil.disciplina;
  }

  void switchToOrientador() {
    nomeBotao = 'orientador';
    controllerTexto.text = perfil.orientador;
  }

  logout() =>
      _authController.logout().then((value) => Modular.to.popAndPushNamed('/'));
}
