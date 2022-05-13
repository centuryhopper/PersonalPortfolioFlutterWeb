import 'package:flutter/material.dart';



class ActionOnHover extends StatefulWidget {
  final Widget? child;
  const ActionOnHover({Key? key, this.child}) : super(key: key);

  @override
  State<ActionOnHover> createState() => _ActionOnHoverState();
}

class _ActionOnHoverState extends State<ActionOnHover> {
  bool amIHovering = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // callback when your mouse pointer enters the underlying widget
      // here you have to use 'PointerEvent'
      onEnter: (PointerEvent details) => {
        setState(() {
          amIHovering = true;
        })
      },

      // callback when your mouse pointer leaves the underlying widget
      onExit: (PointerEvent details) => setState(() {
        amIHovering = false;
      }),
      child: GestureDetector(
        onTap: () {},
        child: widget.child,
      ),
    );
  }
}
