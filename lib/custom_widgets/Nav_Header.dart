

import 'package:flutter/material.dart';
import 'package:personal_portfolio_flutter/responsive_widget.dart';

class NavHeader extends StatelessWidget {
  final List<Widget> navButtons;

  const NavHeader({Key? key, required this.navButtons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Container(
        // color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Row(
            mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // PKDot(),
              // Spacer(flex:2,),
              if (!ResponsiveWidget.isSmallScreen(context))
                Container(
                  // color: Colors.blue,
                  child: Row(
                    children: navButtons,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}