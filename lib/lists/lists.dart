import 'package:intl/intl.dart';
import 'package:personal_portfolio_flutter/constants/constants.dart';
import '../classes/Blog_Card_Contents.dart';

List<BlogCardContents> blogs = [
  BlogCardContents(
      title: 'My New Site',
      preview: RegExp('^.*\n').stringMatch(newWebSiteContent)!,
      contents: newWebSiteContent,
      dateTime: DateFormat.yMMMd().format(DateTime.parse('2022-04-22'))),
  // BlogCardContents(
  //     title: 'Test',
  //     preview: RegExp('^.*\n').stringMatch(finalExams),
  //     contents: finalExams,
  //     dateTime: DateFormat.yMMMd().format(DateTime.parse('2022-04-23'))),
  // BlogCardContents(
  //     title: 'Test',
  //     preview: RegExp('^.*\n').stringMatch(finalExams),
  //     contents: finalExams,
  //     dateTime: DateFormat.yMMMd().format(DateTime.parse('2022-04-23'))),
  // BlogCardContents(
  //     title: 'Test',
  //     preview: RegExp('^.*\n').stringMatch(finalExams),
  //     contents: finalExams,
  //     dateTime: DateFormat.yMMMd().format(DateTime.parse('2022-04-23'))),
  // BlogCardContents(
  //     title: 'Test',
  //     preview: RegExp('^.*\n').stringMatch(finalExams),
  //     contents: finalExams,
  //     dateTime: DateFormat.yMMMd().format(DateTime.parse('2022-04-23'))),
  // BlogCardContents(
  //     title: 'Test',
  //     preview: RegExp('^.*\n').stringMatch(finalExams),
  //     contents: finalExams,
  //     dateTime: DateFormat.yMMMd().format(DateTime.parse('2022-04-23'))),
];
