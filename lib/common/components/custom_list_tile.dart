import 'package:flutter/material.dart';

class CustomLisTileWidget extends StatefulWidget {
  String _image, _price, _title, subtitle, _desc;
  bool enabled;
  Function onTap, onLongPress;

  CustomLisTileWidget(
      this._image, this._price, this._title, {this.subtitle = '', this.enabled = true, this.onTap, this.onLongPress});

  @override
  _CustomLisTileWidgetState createState() => _CustomLisTileWidgetState();
}

class _CustomLisTileWidgetState extends State<CustomLisTileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network('${widget._image}'),
      trailing: Text(
        'R\$: ${widget._price}',
        style: TextStyle(
            color: Colors.green, fontSize: 16.0, fontWeight: FontWeight.w900),
      ),
      title: Text(
        '${widget._title}',
        style: TextStyle(
            color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        '${widget.subtitle}',
        style: TextStyle(
            color: Colors.grey[600],
            fontSize: 15.0,
            fontWeight: FontWeight.w900),
      ),
      isThreeLine: true,
      enabled: widget.enabled,
      onTap: widget.onTap ?? null,
      onLongPress: widget.onLongPress ?? null,
    );
  }
}
