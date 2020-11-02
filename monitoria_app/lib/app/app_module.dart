import 'package:monitoria_app/app/modules/start/submodulos/atendimentos/atendimento_repository.dart';

import 'package:monitoria_app/app/shared/auth_repository.dart';
import 'package:monitoria_app/app/splash/splash_page.dart';

import 'shared/auth_controller.dart';
import 'package:dio/dio.dart';
import 'shared/auth_repository.dart';
import 'package:monitoria_app/app/modules/login/login_module.dart';
import 'package:monitoria_app/app/modules/start/start_module.dart';
import 'package:monitoria_app/app/modules/start/start_page.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:monitoria_app/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AtendimentoRepository,
        Bind((i) => AuthController()),
        Bind((i) => AuthRepository()),
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, __) => SplashPage()),
        ModularRouter('/login', module: LoginModule()),
        ModularRouter('/start', module: StartModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
