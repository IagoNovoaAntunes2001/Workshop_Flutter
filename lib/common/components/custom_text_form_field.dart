import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormWidget extends StatefulWidget {

  TextEditingController _controller;
  String _title;
  Function _validator;
  bool isEnabled;
  TextInputType type;

  TextFormWidget(this._controller, this._title, this._validator, {this.isEnabled = true, this.type = TextInputType.text});

  @override
  _TextFormWidgetState createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnabled ?? true,
      controller: widget._controller,
      decoration: InputDecoration(hintText: widget._title),
      keyboardType: widget.type,
      validator: widget._validator,
    );
  }
}
