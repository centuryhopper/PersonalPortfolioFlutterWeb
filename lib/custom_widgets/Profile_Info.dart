import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio_flutter/Animations/On_Hover_Button.dart';
import 'package:personal_portfolio_flutter/Animations/On_Hover_Profile_Image.dart';
import 'package:personal_portfolio_flutter/Animations/On_Hover_Text.dart';
import 'package:personal_portfolio_flutter/custom_widgets/Nav_Header.dart';
import 'package:personal_portfolio_flutter/custom_widgets/Social_Info.dart';
import 'package:personal_portfolio_flutter/lists/Nav_Buttons_List.dart';
import 'dart:html' as html;

import 'package:personal_portfolio_flutter/responsive_widget.dart';


// TODO: Make profile data column media queries repsonsive

Column profileData(BuildContext context) => Column(
      crossAxisAlignment: ResponsiveWidget.isSmallScreen(context) ||
              ResponsiveWidget.isMediumScreen(context)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: <Widget>[
        TypewriterAnimatedTextKit(
          speed: const Duration(milliseconds: 250),
          text: [
            "Hi there! My name is",
          ],
          textStyle: TextStyle(
            fontSize: 30.0,
            color: Colors.orange,
          ),
          textAlign: TextAlign.start,
          pause: const Duration(milliseconds: 1500),
        ),
        SizedBox(
          width: 250,
          child: TypewriterAnimatedTextKit(
            speed: const Duration(milliseconds: 500),
            text: [
              "Leo\nZhang",
            ],
            textStyle: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
            pause: const Duration(milliseconds: 1250),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        OnHoverText(
          builder: (bool amIHovering) {
            return SelectableText(
              'I am currently seeking a job/internship for anything\n'
              'related to programming and problem solving!',
              textScaleFactor: 1.5,
              style: TextStyle(
                  color: amIHovering ? Colors.orange : Colors.white70),
            );
          },
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            OnHoverButton(
              child: RaisedButton(
                shape: StadiumBorder(),
                child: Text('Résumé'),
                color: Colors.cyan,
                onPressed: () {
                  html.window.open(
                      'https://drive.google.com/file/d/1k-oVcUm6TwIEY6b8X_qwoeKipRF14SzW/view?usp=sharing',
                      'resume');
                },
                padding: EdgeInsets.all(10),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            OnHoverButton(
              child: OutlineButton(
                borderSide: BorderSide(
                  color: Colors.cyanAccent,
                ),
                shape: StadiumBorder(),
                child: Text('Say Hi!'),
                color: Colors.red,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('My Email:'),
                        content: SelectableText(
                            'leoucfstudent@knights.ucf.edu\nor\nleo1997.work@gmail.com'),
                        actions: <Widget>[
                          FlatButton(
                            textColor: Colors.black,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'OK',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                padding: EdgeInsets.all(10),
              ),
            )
          ],
        )
      ],
    );

class LargeScreenProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        NavHeader(navButtons: navButtons(context)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                OnHoverProfileImage(),
                Container(
                  child: OnHoverText(
                    builder: (bool amIHovering) {
                      return SelectableText(
                        "A picture of me at Disney's Magic Kingdom.",
                        textScaleFactor: 1.25,
                        style: TextStyle(
                            color: amIHovering ? Colors.orange : Colors.white),
                      );
                    },
                  ),
                  // color: Colors.blue,
                ),
              ],
            ),
            profileData(context),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        Container(
          // color: Colors.blue,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SocialInfo(),
          ),
        ),
      ],
    );
  }
}

class MediumScreenProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NavHeader(navButtons: navButtons(context)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        OnHoverProfileImage(),
        Container(
          child: OnHoverText(
            builder: (bool amIHovering) {
              return SelectableText(
                "A picture of me at Disney's Magic Kingdom.",
                textScaleFactor: 1.25,
                style: TextStyle(
                    color: amIHovering ? Colors.orange : Colors.white),
              );
            },
          ),
          // color: Colors.blue,
        ),
        profileData(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        Container(
          // color: Colors.blue,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SocialInfo(),
          ),
        ),
      ],
    );
  }
}

class SmallScreenProfileInfo extends StatelessWidget {
  const SmallScreenProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        OnHoverProfileImage(),
        Container(
          child: OnHoverText(
            builder: (bool amIHovering) {
              return SelectableText(
                "A picture of me at Disney's Magic Kingdom.",
                textScaleFactor: 1.25,
                style: TextStyle(
                    color: amIHovering ? Colors.orange : Colors.white),
              );
            },
          ),
          // color: Colors.blue,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        profileData(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        Container(
          // color: Colors.blue,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SocialInfo(),
          ),
        ),
      ],
    );
  }
}


