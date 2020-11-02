import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monitoria_app/app/shared/functions.dart';
import 'package:monitoria_app/app/shared/widgets/botao_app.dart';
import 'package:monitoria_app/app/shared/widgets/caixa_duplo_botao.dart';
import 'package:monitoria_app/app/shared/widgets/caixa_input.dart';
import 'add_aluno_controller.dart';

class AddAlunoPage extends StatefulWidget {
  String title;

  AddAlunoPage(int tipo) {
    tipo == 1 ? title = 'Adicionar Aluno' : title = 'Editar Aluno';
  }

  @override
  _AddAlunoPageState createState() => _AddAlunoPageState();
}

class _AddAlunoPageState
    extends ModularState<AddAlunoPage, AddAlunoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          CaixaInput(
            titulo: 'Nome:',
            controller: controller.controllerNome,
            validator: validator,
            keyboardType: TextInputType.name,
          ),
          CaixaInput(
            titulo: 'Email:',
            controller: controller.controllerEmail,
            validator: validator,
            keyboardType: TextInputType.emailAddress,
          ),
          CaixaInput(
            titulo: 'Matricula:',
            controller: controller.controllerMatricula,
            validator: validator,
            keyboardType: TextInputType.phone,
          ),
          CaixaDuploBotao(
              onPressedLeft: controller.lessFase,
              onPressedRight: controller.addFase,
              caixa: Observer(
                builder: (BuildContext context) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        '${controller.fase}ª',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                },
              ),
              text: 'Fase: '),
          CaixaInput(
            titulo: 'Curso:',
            controller: controller.controllerCurso,
            validator: validator,
            keyboardType: TextInputType.text,
          ),
          Observer(
            builder: (BuildContext context) {
              return BotaoApp(text: widget.title, onPressed: _acaoBotao);
            },
          ),
        ],
      ),
    );
  }

  _acaoBotao() {
    widget.title == 'Adicionar Aluno'
        ? controller.adicionarAluno()
        : controller.atualizarAluno();
    Navigator.pop(context);
  }
}
