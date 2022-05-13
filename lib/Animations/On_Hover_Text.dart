import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

class OnHoverText extends StatefulWidget {
  final Widget Function(bool amIHovering)? builder;
  const OnHoverText({Key? key, this.builder}) : super(key: key);

  @override
  State<OnHoverText> createState() => _OnHoverTextState();
}

class _OnHoverTextState extends State<OnHoverText> {
  bool amIHovering = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, -4, 0);
    final transform = amIHovering ? hoveredTransform : Matrix4.identity();

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
      child: AnimatedContainer(
        curve: Sprung.overDamped,
        duration: const Duration(milliseconds: 300),
        transform: transform,
        child: widget.builder!(amIHovering),
      ),
    );
  }
}
