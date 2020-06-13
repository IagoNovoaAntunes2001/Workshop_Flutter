import 'package:flutter/material.dart';

class CustomAlertDialogWidget extends StatefulWidget {
  String title, content;

  CustomAlertDialogWidget(this.title, this.content);

  @override
  _CustomAlertDialogWidgetState createState() => _CustomAlertDialogWidgetState();
}

class _CustomAlertDialogWidgetState extends State<CustomAlertDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Text(widget.content),
      actions: <Widget>[
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
