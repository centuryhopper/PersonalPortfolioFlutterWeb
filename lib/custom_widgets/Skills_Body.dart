import 'package:flutter/material.dart';
import 'package:personal_portfolio_flutter/constants/constants.dart';

class SkillsBody extends StatelessWidget {
  const SkillsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 100.0, top: 32.0, right: 0, bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Programming Languages:",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: NAV_HEADER_FONT_SIZE,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: const <TextSpan>[
                TextSpan(
                  text:
                      '\u2022 C#. I learned this language when I was learning to use the Unity Game engine to make video games. The language was easy to pick up because it was syntactically similar to Java, which I learned in high school and college.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: NAV_HEADER_FONT_SIZE,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: const <TextSpan>[
                TextSpan(
                  text:
                      '\u2022 Python. This has become my favorite programming language. It reads like English and has many sweet syntactic sugars. I use it for leetcode, OpenCV, filehandling, and automating tasks via webscraping.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: NAV_HEADER_FONT_SIZE,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: const <TextSpan>[
                TextSpan(
                  text:
                      '\u2022 JavaScript. I have learned this language through using Node.Js for building APIs for managing my own passwords, storing images in the cloud, and general storage purposes for any frontend applications I build.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: NAV_HEADER_FONT_SIZE,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: const <TextSpan>[
                TextSpan(
                  text:
                      '\u2022 Dart. This is the language I use for flutter development. I love workflow and design of flutter for cross-platform mobile development. I have found this language very intuitive to learn because of its similarity to Java and JavaScript. Fun fact, this website was built using flutter web!',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: NAV_HEADER_FONT_SIZE,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: const <TextSpan>[
                TextSpan(
                  text:
                      '\u2022 C++. This is the language that had the highest learning curve for me so far. Luckily the C knowledge I acquired from college helped a lot because of pointers and memory address concepts, which most other modern languages lacked. I use this language mainly at my research position for building OpenCV projects which requires low-level control and processing performance-heavy tasks',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: NAV_HEADER_FONT_SIZE,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: const <TextSpan>[
                TextSpan(
                  text:
                      '\u2022 C, Java, Haskell, Erlang. These are mainly languages that I have used for university classes and have built me a solid foundation for learning other languages or frameworks in the software field.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: NAV_HEADER_FONT_SIZE,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
