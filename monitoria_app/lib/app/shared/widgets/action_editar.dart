import 'package:flutter/material.dart';

class ActionEditar extends StatelessWidget {
  final Function onTap;

  ActionEditar({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        'editar',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
