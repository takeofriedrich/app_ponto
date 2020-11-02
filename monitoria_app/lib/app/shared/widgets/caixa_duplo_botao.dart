import 'package:flutter/material.dart';
import 'package:monitoria_app/app/shared/widgets/container_app.dart';

class CaixaDuploBotao extends StatefulWidget {
  final Function onPressedLeft;
  final Function onPressedRight;
  final Widget caixa;
  final String text;
  final Function onPressedLeft2;
  final Function onPressedRight2;
  final Widget caixa2;

  CaixaDuploBotao({
    @required this.onPressedLeft,
    @required this.onPressedRight,
    @required this.caixa,
    @required this.text,
    this.onPressedLeft2,
    this.onPressedRight2,
    this.caixa2,
  });

  @override
  _CaixaDuploBotaoState createState() => _CaixaDuploBotaoState();
}

class _CaixaDuploBotaoState extends State<CaixaDuploBotao> {
  @override
  Widget build(BuildContext context) {
    return ContainerApp(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.text),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                onPressed: widget.onPressedLeft,
              ),
              widget.caixa,
              IconButton(
                icon: Icon(Icons.keyboard_arrow_up_rounded),
                onPressed: widget.onPressedRight,
              ),
              widget.onPressedLeft2 != null
                  ? IconButton(
                      icon: Icon(Icons.keyboard_arrow_down_rounded),
                      onPressed: widget.onPressedLeft2,
                    )
                  : Container(),
              widget.caixa2 != null ? widget.caixa2 : Container(),
              widget.onPressedRight2 != null
                  ? IconButton(
                      icon: Icon(Icons.keyboard_arrow_up_rounded),
                      onPressed: widget.onPressedRight2,
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
