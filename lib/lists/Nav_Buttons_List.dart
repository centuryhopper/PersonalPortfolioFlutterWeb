import 'package:flutter/material.dart';
import 'package:personal_portfolio_flutter/Animations/On_Hover_Button.dart';
import 'package:personal_portfolio_flutter/Popup.dart';
import 'package:personal_portfolio_flutter/classes/App_Routes.dart';
import 'package:personal_portfolio_flutter/constants/constants.dart';
import 'package:personal_portfolio_flutter/custom_widgets/AboutMe_Body.dart';
import 'package:personal_portfolio_flutter/custom_widgets/Contact_Me_Body.dart';
import 'package:personal_portfolio_flutter/custom_widgets/Skills_Body.dart';
import 'package:personal_portfolio_flutter/lists/lists.dart';

import '../custom_widgets/Nav_Buttons_Widget.dart';

List<Widget> navButtons(BuildContext context) => [
      OnHoverButton(
        child: NavButton(
          text: "Home",
          textColor: Colors.black,
          onPressed: () {
            String? currentRoute = ModalRoute.of(context)?.settings.name;
            // print(currentRoute);

            // avoid pushing onto the same page
            if (currentRoute != null && currentRoute != AppRoutes.home) {
              // keeps removing pages from the stack until the predicate returns true and places the route with the name AppRoutes.home onto the stack. In this case the stack will be emptied before placing it on the stack since the predicate will never return true
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
            }
          },
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.005,
        height: MediaQuery.of(context).size.width * 0.025,
      ),
      OnHoverButton(
        child: NavButton(
          text: 'About Me',
          textColor: Colors.black,
          onPressed: () {
            showPopup(context,
                widget: popupBody(
                  body: AboutMeBody(aboutMe: ABOUT_ME),
                ),
                title: 'About Me');
          },
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.005,
        height: MediaQuery.of(context).size.width * 0.025,
      ),
      OnHoverButton(
        child: NavButton(
          text: 'Skills',
          textColor: Colors.black,
          onPressed: () {
            showPopup(context,
                widget: popupBody(
                  body: SkillsBody(),
                ),
                title: 'About Me');
          },
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.005,
        height: MediaQuery.of(context).size.width * 0.025,
      ),
      OnHoverButton(
        child: NavButton(
          text: 'Games',
          textColor: Colors.black,
          onPressed: () {
            showPopup(context,
                widget: popupBody(
                  body: Text('Pending'),
                ),
                title: 'Games');
          },
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.005,
        height: MediaQuery.of(context).size.width * 0.025,
      ),
      OnHoverButton(
        child: NavButton(
          text: 'Contact Me',
          textColor: Colors.black,
          onPressed: () {
            showPopup(context,
                widget: popupBody(
                  body: ContactMeBody(),
                ),
                title: 'Contact Me');
          },
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.005,
        height: MediaQuery.of(context).size.width * 0.025,
      ),
      OnHoverButton(
        child: NavButton(
          text: "Blog",
          textColor: Colors.black,
          onPressed: () {
            String? currentRoute = ModalRoute.of(context)?.settings.name;
            // print(currentRoute);

            // avoid pushing onto the same page
            if (currentRoute != null && currentRoute != AppRoutes.blog) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.blog, (route) => false,
                  arguments: blogs);
            }
          },
        ),
      ),

      // OnHoverButton(
      //   child: NavButton(
      //     text: "poppy",
      //     textColor: Colors.black,
      //     onPressed: () {

      //       Navigator.of(context).pop(context);
      //     },
      //   ),
      // ),
    ];
