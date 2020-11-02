import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/add_aluno/add_aluno_page.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/models/aluno.dart';

import 'package:monitoria_app/app/modules/start/submodulos/alunos/widgets/aluno_widget.dart';
import 'alunos_controller.dart';

class AlunosPage extends StatefulWidget {
  final String title;
  const AlunosPage({Key key, this.title = "Alunos"}) : super(key: key);

  @override
  _AlunosPageState createState() => _AlunosPageState();
}

class _AlunosPageState extends ModularState<AlunosPage, AlunosController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddAlunoPage(1),
            ),
          );
        },
      ),
      body: Observer(
        builder: (BuildContext context) {
          final List<Aluno> alunos = controller.als.values.toList();
          return alunos.length > 0
              ? ListView.builder(
                  itemCount: alunos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AlunoWidget(
                      aluno: alunos[index],
                    );
                  },
                )
              : Center(
                  child: Container(
                    width: 150,
                    child: Text(
                      'Sua lista de alunos está vazia!',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
        },
      ),
    );
  }
}
