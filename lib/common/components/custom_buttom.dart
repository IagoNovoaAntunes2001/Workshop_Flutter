import 'package:flutter/material.dart';
import 'package:palestra_introducao/common/components/loadingWidget.dart';

class CustomButton extends StatefulWidget {
  final String _title;
  final Function onPressed;
  final Color backGroundColor;
  final double height;
  final double width;
  final double fontsize;
  Alignment alignment;
  bool isLoading = false;

  CustomButton(this._title,
      {this.onPressed,
      this.backGroundColor,
      this.height,
      this.width,
      this.fontsize,
      this.alignment = Alignment.center,
      this.isLoading});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? MediaQuery.of(context).size.height * 0.080,
      alignment: widget.alignment,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: [
            widget.backGroundColor,
            widget.backGroundColor,
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: SizedBox.expand(
        child: FlatButton(
          onPressed: widget.isLoading ? null : widget.onPressed,
          disabledColor: Colors.grey[500],
          child: widget.isLoading
              ? LoadingWidget()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget._title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: widget.fontsize ?? 20),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
