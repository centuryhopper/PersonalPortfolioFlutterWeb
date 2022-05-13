import 'package:flutter/material.dart';

class OnHoverButton extends StatefulWidget {
  final Widget? child;
  const OnHoverButton({Key? key, this.child}) : super(key: key);

  @override
  State<OnHoverButton> createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  bool amIHovering = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0,-8,0);
    final transform = amIHovering ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
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
        duration: const Duration(milliseconds: 200),
        transform: transform,
        child: widget.child,
      ),
    );
  }
}
