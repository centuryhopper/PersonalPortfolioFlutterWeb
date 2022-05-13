import 'package:flutter/material.dart';
import 'package:personal_portfolio_flutter/Pages/Base_Page.dart';
import 'package:personal_portfolio_flutter/Pages/BlogDetails_Responsive_Contents.dart';

class BlogDetails extends StatelessWidget {
  final String title, content;
  const BlogDetails({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      largeScreenWidget: LargeBlogDetails(title: title, content: content),
      mediumScreenWidget: MediumBlogDetails(title: title, content: content),
      smallScreenWidget: SmallBlogDetails(title: title, content: content),
    );
  }
}
