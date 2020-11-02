import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/alunos_controller.dart';

import 'package:monitoria_app/app/modules/start/submodulos/alunos/alunos_repository.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/models/aluno.dart';
import 'package:monitoria_app/app/modules/start/submodulos/atendimentos/add_atendimento/add_atendimento_controller.dart';
import 'package:monitoria_app/app/modules/start/submodulos/atendimentos/add_atendimento/add_atendimento_page.dart';
import 'package:monitoria_app/app/modules/start/submodulos/atendimentos/atendimento_repository.dart';
import 'package:monitoria_app/app/modules/start/submodulos/atendimentos/models/atendimento.dart';
import 'package:monitoria_app/app/shared/widgets/caixa_titulo_corpo.dart';
import 'package:monitoria_app/app/shared/widgets/container_app.dart';

// ignore: must_be_immutable
class AtendimentoWidget extends StatelessWidget {
  final Atendimento atendimento;
  final int mes;
  final AlunosController _alunosController = Modular.get<AlunosController>();
  final AddAtendimentoController _addAtendimentoController =
      Modular.get<AddAtendimentoController>();

  Aluno aluno;

  AtendimentoWidget({this.atendimento, @required this.mes}) {
    aluno = _alunosController.als[atendimento.id_aluno] ?? Aluno();
  }

  _campos() => [
        CaixaTituloCorpo(
          titulo: 'Data: ',
          corpo: '${atendimento.dia}/$mes',
        ),
        Divider(
          color: Colors.purple,
        ),
        CaixaTituloCorpo(
          titulo: 'Horário: ',
          corpo: '${Atendimento.horarios[atendimento.horario]}',
        ),
        Divider(
          color: Colors.purple,
        ),
        Observer(
          builder: (BuildContext context) {
            return CaixaTituloCorpo(
                titulo: 'Aluno: ',
                corpo: _alunosController.als[atendimento.id_aluno.toString()] !=
                        null
                    ? _alunosController
                        .als[atendimento.id_aluno.toString()].nome
                    : ' - ');
          },
        ),
        Divider(
          color: Colors.purple,
        ),
        CaixaTituloCorpo(
          titulo: 'Motivo: ',
          corpo: '${Atendimento.motivos[atendimento.motivo]}',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _addAtendimentoController.changeStates(atendimento, mes);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) {
            return AddAtendimentoPage(
                title: AddPageTitle.editar, mes: mes, atendimento: atendimento);
          }),
        );
      },
      child: Dismissible(
        key: Key('atendimento${1}'),
        confirmDismiss: (direction) {
          _confirmarParaRemover(context, 1);
        },
        child: ContainerApp(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _campos(),
          ),
        ),
      ),
    );
  }

  _confirmarParaRemover(BuildContext context, int id) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmar"),
          content: Text("Tem certeza que deseja remover esse atendimento?"),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("Cancelar"),
            ),
            FlatButton(
                onPressed: () {
                  Modular.get<AtendimentoRepository>()
                      .removeAtendimento(atendimento.id, mes);
                  Navigator.of(context).pop(true);
                },
                child: Text("Remover")),
          ],
        );
      },
    );
  }
}
