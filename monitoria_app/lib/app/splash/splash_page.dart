import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobx/mobx.dart';
import 'package:monitoria_app/app/shared/auth_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().then((value) {
      disposer = autorun((_) {
        final auth = Modular.get<AuthController>();
        if (auth.status == AuthStatus.login) {
          Modular.to.pushReplacementNamed('/start');
        } else if (auth.status == AuthStatus.logoff) {
          Modular.to.pushReplacementNamed('/login');
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Carregando...'),
      ),
    );
  }
}
