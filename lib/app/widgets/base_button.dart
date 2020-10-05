import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final void Function() press;
  final Color color, textColor;

  const BaseButton({Key key, this.text, this.press, this.color, this.textColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: textColor,
            ),
          )),
    );
  }
}
