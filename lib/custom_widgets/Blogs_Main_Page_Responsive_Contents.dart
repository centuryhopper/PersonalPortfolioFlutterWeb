import 'package:flutter/material.dart';
import 'package:personal_portfolio_flutter/Animations/On_Hover_Text.dart';
import 'package:personal_portfolio_flutter/classes/Blog_Card_Contents.dart';
import 'package:personal_portfolio_flutter/constants/constants.dart';
import 'package:personal_portfolio_flutter/custom_widgets/Blogs_Collection.dart';
import 'package:personal_portfolio_flutter/custom_widgets/Nav_Header.dart';
import 'package:personal_portfolio_flutter/custom_widgets/Social_Info.dart';
import 'package:personal_portfolio_flutter/lists/Nav_Buttons_List.dart';


class LargeBlogPageContents extends StatefulWidget {
  final List<BlogCardContents> blogCards;

  const LargeBlogPageContents({Key? key, required this.blogCards})
      : super(key: key);

  @override
  State<LargeBlogPageContents> createState() => _LargeBlogPageContentsState();
}

class _LargeBlogPageContentsState extends State<LargeBlogPageContents> {
  bool isDescending = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavHeader(navButtons: navButtons(context)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        OnHoverText(builder: (bool amIHovering) {
          return SelectableText(
            "All Blogs Page",
            textScaleFactor: 1.25,
            style: TextStyle(
              color: amIHovering ? Colors.orange : Colors.white,
              fontSize: BLOG_TEXT_FONT_SIZE,
            ),
          );
        }),
        Divider(height: 50, thickness: 10),
        // add a button for sorting in ascendin or descending order
        TextButton.icon(
            onPressed: () {
              isDescending = !isDescending;
              setState(() {});
            },
            icon: RotatedBox(
              quarterTurns: 1,
              child: Icon(Icons.compare_arrows, size: 28),
            ),
            label: Text(isDescending ? 'Latest' : 'Oldest',
                style: TextStyle(fontSize: BLOG_TEXT_FONT_SIZE))),
        BlogsCollection(
          blogCards: widget.blogCards,
          isDescending: isDescending,
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

class MediumBlogPageContents extends StatefulWidget {
  final List<BlogCardContents> blogCards;

  const MediumBlogPageContents({Key? key, required this.blogCards})
      : super(key: key);

  @override
  State<MediumBlogPageContents> createState() => _MediumBlogPageContentsState();
}

class _MediumBlogPageContentsState extends State<MediumBlogPageContents> {
  bool isDescending = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavHeader(navButtons: navButtons(context)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        OnHoverText(builder: (bool amIHovering) {
          return SelectableText(
            "All Blogs Page",
            textScaleFactor: 1.25,
            style: TextStyle(
              color: amIHovering ? Colors.orange : Colors.white,
              fontSize: BLOG_TEXT_FONT_SIZE,
            ),
          );
        }),
        Divider(height: 50, thickness: 10),
        // add a button for sorting in ascendin or descending order
        TextButton.icon(
            onPressed: () {
              isDescending = !isDescending;
              setState(() {});
            },
            icon: RotatedBox(
              quarterTurns: 1,
              child: Icon(Icons.compare_arrows, size: 28),
            ),
            label: Text(isDescending ? 'Latest' : 'Oldest',
                style: TextStyle(fontSize: BLOG_TEXT_FONT_SIZE))),
        BlogsCollection(
          blogCards: widget.blogCards,
          isDescending: isDescending,
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

class SmallBlogPageContents extends StatefulWidget {
  final List<BlogCardContents> blogCards;

  const SmallBlogPageContents({Key? key, required this.blogCards})
      : super(key: key);

  @override
  State<SmallBlogPageContents> createState() => SmallBlogPageContentsState();
}

class SmallBlogPageContentsState extends State<SmallBlogPageContents> {
  bool isDescending = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OnHoverText(builder: (bool amIHovering) {
          return SelectableText(
            "All Blogs Page",
            textScaleFactor: 1.25,
            style: TextStyle(
              color: amIHovering ? Colors.orange : Colors.white,
              fontSize: BLOG_TEXT_FONT_SIZE,
            ),
          );
        }),
        Divider(height: 50, thickness: 10),
        // add a button for sorting in ascendin or descending order
        TextButton.icon(
            onPressed: () {
              isDescending = !isDescending;
              setState(() {});
            },
            icon: RotatedBox(
              quarterTurns: 1,
              child: Icon(Icons.compare_arrows, size: 28),
            ),
            label: Text(isDescending ? 'Latest' : 'Oldest',
                style: TextStyle(fontSize: BLOG_TEXT_FONT_SIZE))),
        BlogsCollection(
          blogCards: widget.blogCards,
          isDescending: isDescending,
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
