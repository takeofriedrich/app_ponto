import 'package:monitoria_app/app/modules/start/submodulos/alunos/alunos_module.dart';
import 'package:monitoria_app/app/modules/start/submodulos/atendimentos/atendimentos_module.dart';

import 'perfil/perfil_repository.dart';
import 'package:dio/dio.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/alunos_repository.dart';
import 'perfil/perfil_controller.dart';
import 'start_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'start_page.dart';

class StartModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $PerfilRepository,
        $PerfilController,
        $StartController,
        $AlunosRepository,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => StartPage()),
        ModularRouter('/alunos', module: AlunosModule()),
      ];

  static Inject get to => Inject<StartModule>.of();
}
