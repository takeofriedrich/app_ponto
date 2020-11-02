import 'package:flutter/material.dart';
import 'package:monitoria_app/app/shared/widgets/container_app.dart';

class CaixaInput extends StatelessWidget {
  final String titulo;
  final TextEditingController controller;
  final String Function(String) validator;
  final TextInputType keyboardType;

  CaixaInput(
      {@required this.titulo,
      @required this.controller,
      @required this.validator,
      @required this.keyboardType});
  @override
  Widget build(BuildContext context) {
    return ContainerApp(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
            ),
          ),
          Form(
            child: TextFormField(
              controller: controller,
              validator: validator,
              keyboardType: keyboardType,
            ),
          ),
        ],
      ),
    );
  }
}
