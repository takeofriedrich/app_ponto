import 'package:flutter/material.dart';

class CaixaTituloCorpo extends StatelessWidget {
  final String titulo;
  final String corpo;
  final Widget action;

  CaixaTituloCorpo({@required this.titulo, @required this.corpo, this.action});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
        ),
        action == null
            ? Flexible(
                child: Text(
                  ' $corpo',
                  textAlign: TextAlign.center,
                ),
              )
            : Text(
                ' $corpo',
                textAlign: TextAlign.start,
              ),
        action != null ? Spacer() : Container(),
        action != null ? action : Container(),
      ],
    );
  }
}
