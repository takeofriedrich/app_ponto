import 'package:monitoria_app/app/modules/start/submodulos/atendimentos/add_atendimento/add_atendimento_page.dart';

import 'add_atendimento/add_atendimento_controller.dart';
import 'package:dio/dio.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/alunos_controller.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/alunos_repository.dart';
import 'atendimento_repository.dart';
import 'atendimentos_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'atendimentos_page.dart';

class AtendimentosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $AddAtendimentoController,
        $AtendimentoRepository,
        $AtendimentosController,
        $AlunosController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => AtendimentosPage(),
        )
      ];

  static Inject get to => Inject<AtendimentosModule>.of();
}
