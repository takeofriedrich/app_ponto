import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monitoria_app/app/shared/functions.dart';
import 'package:monitoria_app/app/shared/widgets/action_editar.dart';
import 'package:monitoria_app/app/shared/widgets/botao_app.dart';
import 'package:monitoria_app/app/shared/widgets/caixa_input.dart';
import 'package:monitoria_app/app/shared/widgets/caixa_titulo_corpo.dart';
import 'package:monitoria_app/app/shared/widgets/container_app.dart';
import 'perfil_controller.dart';

class PerfilPage extends StatefulWidget {
  final String title;
  const PerfilPage({Key key, this.title = "Perfil"}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends ModularState<PerfilPage, PerfilController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: Container(),
        actions: [
          IconButton(
            icon: Icon(Icons.login_outlined),
            onPressed: controller.logout,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Observer(
            builder: (BuildContext context) {
              return Container(
                margin: const EdgeInsets.all(10),
                child: Center(
                  child: controller.perfil.url.isEmpty
                      ? Container()
                      : Image.network(controller.perfil.url),
                ),
              );
            },
          ),
          ContainerApp(
            child: Column(
              children: [
                Observer(
                  builder: (context) {
                    return CaixaTituloCorpo(
                      titulo: 'Nome:',
                      corpo: controller.perfil.nome,
                      action: ActionEditar(onTap: controller.switchToNome),
                    );
                  },
                ),
                Divider(
                  color: Colors.purple,
                ),
                Observer(
                  builder: (context) {
                    return CaixaTituloCorpo(
                      titulo: 'Disciplina:',
                      corpo: controller.perfil.disciplina,
                      action:
                          ActionEditar(onTap: controller.switchToDisciplina),
                    );
                  },
                ),
                Divider(
                  color: Colors.purple,
                ),
                Observer(
                  builder: (context) {
                    return CaixaTituloCorpo(
                      titulo: 'Orientador:',
                      corpo: controller.perfil.orientador,
                      action:
                          ActionEditar(onTap: controller.switchToOrientador),
                    );
                  },
                ),
              ],
            ),
          ),
          Observer(
            builder: (BuildContext context) {
              return CaixaInput(
                  titulo: 'Alterar ${controller.nomeBotao}:',
                  controller: controller.controllerTexto,
                  validator: validator,
                  keyboardType: TextInputType.name);
            },
          ),
          Observer(
            builder: (BuildContext context) {
              return BotaoApp(
                  text: 'Alterar ${controller.nomeBotao}',
                  onPressed: controller.alterarEValidar);
            },
          ),
        ],
      ),
    );
  }

  _tituloECorpo(String titulo, String corpo, Function onTap) {
    return Row(
      children: [
        Text(
          titulo,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
        ),
        Text(' $corpo'),
        Spacer(),
        InkWell(
          onTap: onTap,
          child: Text(
            'editar',
            style: TextStyle(color: Colors.grey),
          ),
        )
      ],
    );
  }
}
