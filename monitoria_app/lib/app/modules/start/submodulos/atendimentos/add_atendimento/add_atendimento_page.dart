import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:monitoria_app/app/modules/start/submodulos/atendimentos/models/atendimento.dart';
import 'package:monitoria_app/app/shared/widgets/botao_app.dart';

import 'package:monitoria_app/app/shared/widgets/caixa_duplo_botao.dart';
import 'package:monitoria_app/app/shared/widgets/container_app.dart';
import 'add_atendimento_controller.dart';

class AddAtendimentoPage extends StatefulWidget {
  final AddPageTitle title;
  final int mes;
  final Atendimento atendimento;

  AddAtendimentoPage(
      {@required this.title, @required this.mes, @required this.atendimento});
  @override
  _AddAtendimentoPageState createState() => _AddAtendimentoPageState();
}

class _AddAtendimentoPageState
    extends ModularState<AddAtendimentoPage, AddAtendimentoController> {
  @override
  Widget build(BuildContext context) {
    controller.changeStates(widget.atendimento, widget.mes);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title == AddPageTitle.adicionar
            ? 'Adicionar Atendimento'
            : 'Editar Atendimento'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Observer(
              builder: (BuildContext context) {
                return Icon(controller.comAluno
                    ? Icons.face_outlined
                    : Icons.science_outlined);
              },
            ),
            onPressed: controller.trocaAluno,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          _caixaData(),
          _caixaHorario(),
          _caixaAluno(),
          _caixaMotivo(),
          _botao(),
        ],
      ),
    );
  }

  _caixaData() {
    return CaixaDuploBotao(
      onPressedLeft: controller.decrementDia,
      onPressedRight: controller.incrementDia,
      caixa: Observer(
        builder: (BuildContext context) {
          return Expanded(
            child: Center(
              child: Text(
                controller.dia.toString(),
                style: TextStyle(fontSize: 15),
              ),
            ),
          );
        },
      ),
      text: 'Data:',
      caixa2: Observer(
        builder: (BuildContext context) {
          return Expanded(
            flex: 3,
            child: Center(
              child: Text(
                Atendimento.meses[controller.mes],
                style: TextStyle(fontSize: 15),
              ),
            ),
          );
        },
      ),
      onPressedLeft2: controller.decrementMes,
      onPressedRight2: controller.incrementMes,
    );
  }

  _caixaHorario() {
    return CaixaDuploBotao(
        onPressedLeft: controller.decrementHorario,
        onPressedRight: controller.incrementHorario,
        caixa: Observer(
          builder: (BuildContext context) {
            return Expanded(
              child: Center(
                child: Text(
                  Atendimento.horarios[controller.horario],
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          },
        ),
        text: 'Horario:');
  }

  _caixaAluno() => Observer(
        builder: (BuildContext context) {
          return controller.comAluno
              ? Container()
              : CaixaDuploBotao(
                  onPressedLeft: controller.previouslyAluno,
                  onPressedRight: controller.nextAluno,
                  text: 'Aluno:',
                  caixa: Expanded(
                    child: Center(
                      child: Text(
                        controller.aluno.nome,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                );
        },
      );

  _caixaMotivo() => CaixaDuploBotao(
        onPressedLeft: controller.decrementaMotivo,
        onPressedRight: controller.incrementaMotivo,
        text: 'Motivo:',
        caixa: Observer(
          builder: (BuildContext context) {
            return Expanded(
              child: Center(
                child: Text(
                  Atendimento.motivos[controller.motivo],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            );
          },
        ),
      );

  _botao() {
    return BotaoApp(
      text: widget.title == AddPageTitle.adicionar ? 'Adicionar' : 'Editar',
      onPressed: () {
        widget.title == AddPageTitle.adicionar
            ? controller
                .adicionarAtendimento()
                .then((value) => Navigator.pop(context))
            : controller
                .editarAtendimento(widget.atendimento.id)
                .then((value) => Navigator.pop(context));
      },
    );
  }
}
