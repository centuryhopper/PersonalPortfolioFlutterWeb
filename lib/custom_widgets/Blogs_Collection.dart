import 'package:flutter/material.dart';
import 'package:personal_portfolio_flutter/classes/Blog_Card_Contents.dart';
import 'package:personal_portfolio_flutter/custom_widgets/Blog_Card.dart';

class BlogsCollection extends StatelessWidget {
  final List<BlogCardContents> blogCards;
  final bool isDescending;
  const BlogsCollection(
      {Key? key, required this.blogCards, required this.isDescending})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 0),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: blogCards.length,
          itemBuilder: (context, index) {
            final sortedCards = blogCards
              ..sort((i1, i2) => isDescending
                  ? i2.dateTime.compareTo(i1.dateTime)
                  : i1.dateTime.compareTo(i2.dateTime));
            final blogCard = sortedCards[index];
            var title = blogCard.title;
            var dateTime = blogCard.dateTime;
            var preview = blogCard.preview;
            var contents = blogCard.contents;
            return Padding(
              padding: const EdgeInsets.all(12),
              child: BlogCard(
                title: title,
                dateTime: dateTime,
                preview: preview,
                contents: contents,
              ),
            );
          }),
    );
  }
}