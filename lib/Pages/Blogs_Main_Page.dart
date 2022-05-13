import 'package:flutter/material.dart';
import 'package:personal_portfolio_flutter/Pages/Base_Page.dart';
import 'package:personal_portfolio_flutter/custom_widgets/Blogs_Main_Page_Responsive_Contents.dart';
import '../classes/Blog_Card_Contents.dart';

class BlogsMainPage extends StatelessWidget {
  final List<BlogCardContents> blogCards;
  const BlogsMainPage({Key? key, required this.blogCards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      largeScreenWidget: LargeBlogPageContents(blogCards: blogCards),
      mediumScreenWidget: MediumBlogPageContents(blogCards: blogCards),
      smallScreenWidget: SmallBlogPageContents(blogCards: blogCards),
    );
  }
}
