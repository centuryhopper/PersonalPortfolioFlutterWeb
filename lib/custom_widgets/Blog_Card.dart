import 'package:flutter/material.dart';
import 'package:personal_portfolio_flutter/classes/App_Routes.dart';
import 'package:personal_portfolio_flutter/constants/constants.dart';

class BlogDetailProps {
  final String title, contents;
  BlogDetailProps(this.title, this.contents);
}

class BlogCard extends StatefulWidget {
  final String title, preview, contents, dateTime;
  const BlogCard(
      {Key? key,
      required this.title,
      required this.dateTime,
      required this.preview,
      required this.contents})
      : super(key: key);

  @override
  State<BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  bool amIHovering = false;
  Offset exitFrom = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MouseRegion(
              // make sure that the mouse pointer changes to a hand on entering the region
              cursor: SystemMouseCursors.click,
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
                // storing the exit position
                exitFrom = details
                    .localPosition; // You can use details.position if you are interested in the global position of your pointer.
              }),

              child: GestureDetector(
                onTap: () {
                  String? currentRoute = ModalRoute.of(context)?.settings.name;
                  // print(currentRoute);
                  if (currentRoute != null) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.blog_details,
                      (route) => route.isFirst,
                      arguments: BlogDetailProps(widget.title, widget.contents),
                    );
                  }
                },
                child: Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: BLOG_TEXT_FONT_SIZE,
                      decoration:
                          amIHovering ? TextDecoration.underline : null),
                ),
              ),
            ),
            Text(
              widget.dateTime,
              style: TextStyle(
                fontSize: BLOG_TEXT_FONT_SIZE,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.preview,
              style: TextStyle(
                fontSize: BLOG_TEXT_FONT_SIZE,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
