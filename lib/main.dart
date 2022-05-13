import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_portfolio_flutter/Pages/PersonalPortfolio.dart';


/// variables to initialize before running the app should be included in this method
void initialize() {}

Future<void> main() async {
  // initialize();
  // print(RegExp('^.*\n').stringMatch(newWebSiteContent));
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const PersonalPorfolioPage());
}



/*

TODO:

- Add description to profile picture ✅
- Add smtp functionailty ✅
- Add a blogs collection page to your profile ✅
- Add animations to buttons and text ✅

*/