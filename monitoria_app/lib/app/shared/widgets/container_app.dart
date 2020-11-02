import 'package:flutter/material.dart';

class ContainerApp extends StatelessWidget {
  final Widget child;

  ContainerApp({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.purple,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        color: Colors.purple[50],
      ),
      child: child,
    );
  }
}
