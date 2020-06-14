import 'package:flutter/material.dart';

class CustomViewWidget extends StatefulWidget {
  String _title;

  CustomViewWidget(this._title);

  @override
  _CustomViewWidgetState createState() => _CustomViewWidgetState();
}

class _CustomViewWidgetState extends State<CustomViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        widget._title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
