import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:personal_portfolio_flutter/Animations/On_Hover_Button.dart';
import 'package:personal_portfolio_flutter/custom_widgets/Nav_Buttons_Widget.dart';
import 'package:personal_portfolio_flutter/responsive_widget.dart';

class SocialInfo extends StatelessWidget {
  List<Widget> socialMediaWidgets(BuildContext context) => <Widget>[
        OnHoverButton(
          child: NavButton(
            textColor: Colors.black,
            text: 'Github',
            onPressed: () {
              html.window.open('https://github.com/leozhang1', 'Git');
            },
            // color: Colors.blue,
          ),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.005,
            height: MediaQuery.of(context).size.width * 0.01),
        OnHoverButton(
          child: NavButton(
            textColor: Colors.black,
            text: 'LinkedIn',
            onPressed: () {
              html.window.open(
                  'https://www.linkedin.com/in/leo-zhang2020/', 'LinkedIn');
            },
            // color: Colors.blue,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.005,
          height: MediaQuery.of(context).size.width * 0.01,
        ),
        OnHoverButton(
          child: NavButton(
            textColor: Colors.black,
            text: 'Facebook',
            onPressed: () {
              html.window
                  .open('https://www.facebook.com/leo.zhang.31105/', 'Fb');
            },
            // color: Colors.blue,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.005,
          height: MediaQuery.of(context).size.width * 0.01,
        ),
      ];

  Widget copyRightText() => Text(
        'Leo Zhang ©️ ${DateTime.now().year}',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: socialMediaWidgets(context),
          ),
          copyRightText(),
        ],
      ),
      smallScreen: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 72.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...socialMediaWidgets(context),
            copyRightText(),
          ],
        ),
      ),
    );
  }
}
