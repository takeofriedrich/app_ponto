import 'add_aluno/add_aluno_controller.dart';
import 'package:dio/dio.dart';
import 'alunos_repository.dart';
import 'alunos_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'alunos_page.dart';

class AlunosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $AddAlunoController,
        $AlunosRepository,
        $AlunosController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => AlunosPage()),
      ];

  static Inject get to => Inject<AlunosModule>.of();
}
