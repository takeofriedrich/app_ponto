import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monitoria_app/app/modules/start/perfil/perfil_page.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/alunos_module.dart';
import 'package:monitoria_app/app/modules/start/submodulos/atendimentos/atendimentos_module.dart';
import 'start_controller.dart';

class StartPage extends StatefulWidget {
  final String title;
  const StartPage({Key key, this.title = "Start"}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends ModularState<StartPage, StartController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageViewController,
        children: [
          RouterOutlet(
            module: AtendimentosModule(),
          ),
          RouterOutlet(
            module: AlunosModule(),
          ),
          PerfilPage(),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: controller.pageViewController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              selectedItemColor: Colors.yellow,
              selectedIconTheme: IconThemeData(color: Colors.yellow),
              unselectedIconTheme: IconThemeData(color: Colors.white),
              unselectedItemColor: Colors.white,
              backgroundColor: Colors.purple,
              currentIndex: controller.pageViewController?.page?.round() ?? 0,
              onTap: (value) {
                controller.pageViewController.jumpToPage(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.article_outlined,
                  ),
                  label: 'Atendimentos',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline,
                  ),
                  label: 'Alunos',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle_outlined,
                  ),
                  label: 'Perfil',
                ),
              ],
            );
          }),
    );
  }
}
