import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monitoria_app/app/modules/start/submodulos/alunos/add_aluno/add_aluno_controller.dart';
import 'package:monitoria_app/app/modules/start/submodulos/atendimentos/add_atendimento/add_atendimento_controller.dart';
import 'package:monitoria_app/app/modules/start/submodulos/atendimentos/add_atendimento/add_atendimento_page.dart';
import 'package:monitoria_app/app/modules/start/submodulos/atendimentos/models/atendimento.dart';
import 'package:monitoria_app/app/modules/start/submodulos/atendimentos/widgets/atendimento_widget.dart';
import 'atendimentos_controller.dart';

class AtendimentosPage extends StatefulWidget {
  final String title;
  const AtendimentosPage({Key key, this.title = "Atendimentos"})
      : super(key: key);

  @override
  _AtendimentosPageState createState() => _AtendimentosPageState();
}

class _AtendimentosPageState
    extends ModularState<AtendimentosPage, AtendimentosController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (BuildContext context) {
            final mes = controller.mes;
            return Column(
              children: [
                Text(widget.title),
                Text(
                  Atendimento.meses[mes],
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ],
            );
          },
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: controller.botaoEsquerda),
        actions: [
          IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: controller.botaoDireita),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'addAtend',
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) {
              return AddAtendimentoPage(
                title: AddPageTitle.adicionar,
                mes: DateTime.now().month,
                atendimento: Atendimento(),
              );
            }),
          );
        },
      ),
      body: Observer(
        builder: (context) {
          final atendimentos = controller.atendimentos[controller.mes];
          atendimentos.sort((a1, a2) => a1.compareTo(a2));
          return atendimentos.isEmpty
              ? Center(
                  child: Container(
                    width: 150,
                    child: Text(
                      'A lista de atendimentos do mês selecionado está vazia!',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: atendimentos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AtendimentoWidget(
                      atendimento: atendimentos[index],
                      mes: controller.mes,
                    );
                  },
                );
        },
      ),
    );
  }
}
