import 'package:flutter/material.dart';
import 'package:personal_portfolio_flutter/constants/constants.dart';
import 'package:personal_portfolio_flutter/custom_widgets/Nav_Header.dart';
import 'package:personal_portfolio_flutter/custom_widgets/Social_Info.dart';
import 'package:personal_portfolio_flutter/lists/Nav_Buttons_List.dart';


class LargeBlogDetails extends StatelessWidget {
  final title, content;
  const LargeBlogDetails({Key? key, this.title, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavHeader(navButtons: navButtons(context)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white70,
              fontSize: BLOG_TEXT_FONT_SIZE,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Text(
            content,
            style: TextStyle(
              fontSize: BLOG_TEXT_FONT_SIZE,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
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

class MediumBlogDetails extends StatelessWidget {
  final title, content;
  const MediumBlogDetails({Key? key, this.title, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavHeader(navButtons: navButtons(context)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white70,
              fontSize: BLOG_TEXT_FONT_SIZE,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Text(
            content,
            style: TextStyle(
              fontSize: BLOG_TEXT_FONT_SIZE,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
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

class SmallBlogDetails extends StatelessWidget {
  final title, content;
  const SmallBlogDetails({Key? key, this.title, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white70,
              fontSize: BLOG_TEXT_FONT_SIZE,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Text(
            content,
            style: TextStyle(
              fontSize: BLOG_TEXT_FONT_SIZE,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
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
