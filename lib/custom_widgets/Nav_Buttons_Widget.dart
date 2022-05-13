import 'package:flutter/material.dart';


class NavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color, textColor;

  const NavButton(
      {Key? key,
      @required this.text,
      @required this.onPressed,
      this.color = Colors.deepOrangeAccent,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
      onPressed: onPressed,
    );
  }
}