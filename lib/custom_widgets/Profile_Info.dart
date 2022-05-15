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
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Hello world!',
              textStyle: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
              textAlign: TextAlign.start,
              speed: const Duration(milliseconds: 250),
            ),
          ],
          pause: const Duration(milliseconds: 1500),
        ),
        SizedBox(
          width: 250,
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                "Leo\nZhang",
                textStyle: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
                speed: const Duration(milliseconds: 500),
              ),
            ],
            pause: const Duration(milliseconds: 1250),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        OnHoverText(
          builder: (bool amIHovering) {
            return SelectableText(
              'I am currently seeking a job/internship for anything\n'
              'related to computer programming and problem solving!',
              textScaleFactor: 1.5,
              style: TextStyle(
                  color: amIHovering ? Colors.orange : Colors.white70),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            OnHoverButton(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.all(10),
                ),
                child: const Text('Résumé'),
                onPressed: () {
                  html.window.open(
                      'https://drive.google.com/file/d/1k-oVcUm6TwIEY6b8X_qwoeKipRF14SzW/view?usp=sharing',
                      'resume');
                },
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            OnHoverButton(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.red,
                  side: const BorderSide(
                    color: Colors.cyanAccent,
                  ),
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.all(10),
                ),
                child: const Text('Say Hi!'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('My Email:'),
                        content: const SelectableText(
                            'leoucfstudent@knights.ucf.edu\nor\nleo1997.work@gmail.com'),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'OK',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
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
                const OnHoverProfileImage(),
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
        const OnHoverProfileImage(),
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
        const OnHoverProfileImage(),
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
