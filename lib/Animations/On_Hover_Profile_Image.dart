import 'package:flutter/material.dart';
import 'package:personal_portfolio_flutter/responsive_widget.dart';

class OnHoverProfileImage extends StatefulWidget {
  const OnHoverProfileImage();

  @override
  _OnHoverProfileImageState createState() => _OnHoverProfileImageState();
}

class _OnHoverProfileImageState extends State<OnHoverProfileImage>
    with TickerProviderStateMixin {
  late AnimationController _resizableController;

  bool amIHovering = false;

  AnimatedBuilder getContainer() {
    return AnimatedBuilder(
        animation: _resizableController,
        builder: (context, child) {
          return Container(
            padding: const EdgeInsets.all(24),
            child: const Text("SAMPLE"),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.all(
                  color: Colors.blue, width: _resizableController.value * 10),
            ),
          );
        });
  }

  @override
  void initState() {
    _resizableController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    )
      ..addStatusListener((animationStatus) {
        switch (animationStatus) {
          case AnimationStatus.completed:
            _resizableController.reverse();
            break;
          case AnimationStatus.dismissed:
            _resizableController.forward();
            break;
          case AnimationStatus.forward:
            break;
          case AnimationStatus.reverse:
            break;
        }
      })
      ..forward();
    super.initState();
  }

  @override
  void dispose() {
    _resizableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double large = 0.25, medium = 0.25, small = 0.25;

    Widget containerImg() => Container(
      height: ResponsiveWidget.isSmallScreen(context)
          ? MediaQuery.of(context).size.height * small
          : ResponsiveWidget.isMediumScreen(context)
              ? MediaQuery.of(context).size.height * medium
              : MediaQuery.of(context).size.width * large,
      width: ResponsiveWidget.isSmallScreen(context)
          ? MediaQuery.of(context).size.height * small
          : ResponsiveWidget.isMediumScreen(context)
              ? MediaQuery.of(context).size.height * medium
              : MediaQuery.of(context).size.width * large,
      decoration: BoxDecoration(
        // backgroundBlendMode: BlendMode.clear,
        // borderRadius: BorderRadius.circular(40),
        border: Border.all(
            color: Colors.blue,
            width: amIHovering ? _resizableController.value * 10 : 1),
        color: Colors.greenAccent,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/Leo_Magic_Kingdom.jpg'),
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
      ),
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.all(40),
    );

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
      child: AnimatedBuilder(
        animation: _resizableController,
        builder: (context, child) {
          return containerImg();
        },
      ),
    );
  }
}
