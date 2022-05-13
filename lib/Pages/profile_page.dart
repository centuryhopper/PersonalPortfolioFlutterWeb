import 'package:flutter/material.dart';
import 'package:personal_portfolio_flutter/Pages/Base_Page.dart';
import 'package:personal_portfolio_flutter/custom_widgets/Profile_Info.dart';

// import 'package:js/js_util.dart' as jsutil;

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      largeScreenWidget: LargeScreenProfileInfo(),
      mediumScreenWidget: MediumScreenProfileInfo(),
      smallScreenWidget: SmallScreenProfileInfo(),
    );
  }
}


/*
Column(
                      children: <Widget>[
                        Tooltip(
                          message: 'Top down 2D stealth game',
                          child: ElevatedButton(
                            onPressed: () {
                              html.window.open(
                                  'https://wayneheucf.itch.io/desperate-escape',
                                  'project1');
                            },
                            style: ButtonStyle(backgroundColor: Colors.grey, ),

                            textColor: Colors.white,
                            child: Center(
                              child: Text('Check out my game'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Tooltip(
                          message:
                              'Upload either red apples or tomatoes and watch my model accurately identify between the two. I recommend using file mode once you\'re in the link',
                          child: RaisedButton(
                            onPressed: () {
                              html.window.open(
                                  'https://teachablemachine.withgoogle.com/models/ar89v4khJ/',
                                  'trainedModel');
                            },
                            color: Colors.grey,
                            textColor: Colors.white,
                            child: Center(
                              child: Text('Check out my trained model Here'),
                            ),
                          ),
                        ),
                      ],
                    ),

 */