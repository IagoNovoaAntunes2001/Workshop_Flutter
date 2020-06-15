import 'package:flutter/material.dart';

class CustomLisTileWidget extends StatefulWidget {
  String leading, price, title, subtitle;
  bool enabled;
  Function onTap, onLongPress;

  CustomLisTileWidget(
      {this.leading, this.price, this.title, this.subtitle = '', this.enabled = true, this.onTap, this.onLongPress});

  @override
  _CustomLisTileWidgetState createState() => _CustomLisTileWidgetState();
}

class _CustomLisTileWidgetState extends State<CustomLisTileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network('${widget.leading}'),
      trailing: Text(
        'R\$: ${double.parse(widget.price).toStringAsFixed(2)}',
        style: TextStyle(
            color: Colors.green, fontSize: 16.0, fontWeight: FontWeight.w900),
      ),
      title: Text(
        '${widget.title}',
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
