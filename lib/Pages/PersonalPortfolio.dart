import 'package:flutter/material.dart';
import 'package:personal_portfolio_flutter/classes/App_Routes.dart';
import 'package:personal_portfolio_flutter/classes/Route_Generator.dart';

class PersonalPorfolioPage extends StatelessWidget {
  const PersonalPorfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Colors.black,
        fontFamily: 'GoogleSansRegular',
      ),
      initialRoute: AppRoutes.home,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}