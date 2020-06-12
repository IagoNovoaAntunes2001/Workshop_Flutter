import 'package:flutter/material.dart';

class TextFormWidget extends StatefulWidget {

  TextEditingController controller;
  String title;
  Function validator;

  TextFormWidget(this.controller, this.title, this.validator);

  @override
  _TextFormWidgetState createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(hintText: widget.title),
      keyboardType: TextInputType.text,
      validator: widget.validator,
    );;
  }
}
