import 'package:flutter/material.dart';

class CustomAlertDialogWidget extends StatefulWidget {
  String title = '',
      content = '',
      titleButtonFirst = '',
      titleSecondButton = '';
  Function onPressedFirstButton, onPressedSecondButton;
  Color fistColor, secondColor;

  CustomAlertDialogWidget(
    this.title,
    this.content, {
    this.titleButtonFirst,
    this.onPressedFirstButton,
    this.titleSecondButton,
    this.onPressedSecondButton,
    this.fistColor = Colors.blueGrey,
    this.secondColor = Colors.blueGrey,
  });

  @override
  _CustomAlertDialogWidgetState createState() =>
      _CustomAlertDialogWidgetState();
}

class _CustomAlertDialogWidgetState extends State<CustomAlertDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Text(widget.content),
      actions: <Widget>[
        widget.onPressedFirstButton == null
            ? Container()
            : FlatButton(
                child: Text(widget.titleButtonFirst),
                onPressed: widget.onPressedFirstButton ?? null,
                color: widget.fistColor,
              ),
        widget.onPressedSecondButton == null
            ? Container()
            : FlatButton(
                child: Text(widget.titleSecondButton),
                onPressed: widget.onPressedSecondButton ?? null,
                color: widget.secondColor,
              ),
      ],
    );
  }
}
