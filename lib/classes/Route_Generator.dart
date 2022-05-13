import 'package:flutter/material.dart';
import 'package:personal_portfolio_flutter/Pages/Blog_Details_Page.dart';
import 'package:personal_portfolio_flutter/Pages/Blogs_Main_Page.dart';
import 'package:personal_portfolio_flutter/Pages/profile_page.dart';
import 'package:personal_portfolio_flutter/classes/App_Routes.dart';
import 'package:personal_portfolio_flutter/classes/Blog_Card_Contents.dart';
import 'package:personal_portfolio_flutter/custom_widgets/Blog_Card.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.home:
        // return MaterialPageRoute(
        //     builder: (_) => ProfilePage(), settings: settings);
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, _) {
              return ProfilePage();
            },
            opaque: false);
      case AppRoutes.blog:
        if (args is List<BlogCardContents>) {
          // return MaterialPageRoute(
          //     builder: (_) => BlogsMainPage(
          //           blogCards: args,
          //         ),
          //     settings: settings);
          return PageRouteBuilder(
            opaque: false,
            settings: settings,
            pageBuilder: (context, animation, _) {
              return BlogsMainPage(
                blogCards: args,
              );
            },
          );
        }

        return _errorRoute();
      case AppRoutes.blog_details:
        BlogDetailProps arguments = args as BlogDetailProps;
        // return MaterialPageRoute(
        //     builder: (_) => BlogDetails(
        //           title: arguments?.title ?? "ERROR",
        //           content: arguments?.contents ?? "ERROR",
        //         ),
        //     settings: settings);
        return PageRouteBuilder(
          opaque: false,
          settings: settings,
          pageBuilder: (context, animation, _) {
            return BlogDetails(
              title: arguments?.title ?? "ERROR",
              content: arguments?.contents ?? "ERROR",
            );
          },
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(child: Text('ERROR')),
      );
    });
  }
}
