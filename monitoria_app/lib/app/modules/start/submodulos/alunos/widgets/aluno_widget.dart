import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/add_aluno/add_aluno_controller.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/add_aluno/add_aluno_page.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/alunos_repository.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/models/aluno.dart';
import 'package:monitoria_app/app/shared/widgets/caixa_titulo_corpo.dart';
import 'package:monitoria_app/app/shared/widgets/container_app.dart';

class AlunoWidget extends StatelessWidget {
  final Aluno aluno;

  AlunoWidget({this.aluno});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.get<AddAlunoController>().enterInfos(aluno);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) {
            return AddAlunoPage(2);
          }),
        );
      },
      child: Dismissible(
        key: Key('aluno${aluno.id}'),
        confirmDismiss: (direction) {
          confirmarParaRemover(context, aluno.id);
        },
        child: ContainerApp(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CaixaTituloCorpo(titulo: 'Nome:', corpo: aluno.nome),
              Divider(
                color: Colors.purple,
              ),
              CaixaTituloCorpo(titulo: 'Matricula:', corpo: aluno.matricula),
              Divider(
                color: Colors.purple,
              ),
              CaixaTituloCorpo(titulo: 'Email:', corpo: aluno.email),
              Divider(
                color: Colors.purple,
              ),
              CaixaTituloCorpo(titulo: 'Fase:', corpo: aluno.fase),
              Divider(
                color: Colors.purple,
              ),
              CaixaTituloCorpo(titulo: 'Curso:', corpo: aluno.curso),
            ],
          ),
        ),
      ),
    );
  }

  confirmarParaRemover(BuildContext context, int id) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmar"),
          content: Text("Tem certeza que deseja remover esse aluno?"),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("Cancelar"),
            ),
            FlatButton(
                onPressed: () {
                  Modular.get<AlunosRepository>().removeAluno(id);
                  Navigator.of(context).pop(true);
                },
                child: Text("Remover")),
          ],
        );
      },
    );
  }
}
