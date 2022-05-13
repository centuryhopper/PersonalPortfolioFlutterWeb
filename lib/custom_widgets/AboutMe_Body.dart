import 'package:flutter/material.dart';
import 'package:personal_portfolio_flutter/constants/constants.dart';

class AboutMeBody extends StatelessWidget
{
  final String aboutMe;
  const AboutMeBody({Key? key, required this.aboutMe}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.only(
          left: 100.0, top: 32.0, right: 100, bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            aboutMe,
            style: TextStyle(
                fontSize: NAV_HEADER_FONT_SIZE,
                // line height
                height: 1.5),
          ),
        ],
      ),
    );
  }
}
