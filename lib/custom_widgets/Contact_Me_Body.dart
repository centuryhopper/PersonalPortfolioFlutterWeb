import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio_flutter/Animations/On_Hover_Button.dart';
import 'package:personal_portfolio_flutter/classes/portfolio_contact.dart';
import 'package:personal_portfolio_flutter/constants/constants.dart';
import 'package:http/http.dart' as http;

class ContactMeBody extends StatefulWidget {
  const ContactMeBody({Key? key}) : super(key: key);

  @override
  State<ContactMeBody> createState() => _ContactMeBodyState();
}

class _ContactMeBodyState extends State<ContactMeBody> {
  Map<String, TextEditingController> controllerMap = {
    'name': TextEditingController(),
    'email': TextEditingController(),
    'subject': TextEditingController(),
    'message': TextEditingController(),
  };

  bool _didSubmit = false;

  bool _alreadyShowingTimeOut = false;

  late FToast _fToast;

  final endPoint =
      'https://nodejs-portfolio-contacts.herokuapp.com/portfolio_contacts/';

  @override
  void initState() {
    super.initState();
    _fToast = FToast();
    _fToast.init(context);
  }

  @override
  void dispose() {
    for (var k in controllerMap.keys) {
      controllerMap[k]?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Future sendEmail(
    //     {required String name,
    //     required String email,
    //     required String subject,
    //     required String message}) async {
    //   // https://api.emailjs.com/api/v1.0/email/send
    //   const serviceId = "service_3ljw4pe";
    //   const templateId = "template_6ohympj";
    //   const userId = "102oHsGTkdn0Y2wai";

    //   final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    //   final response = await http.post(
    //     url,
    //     headers: {
    //       // the origin key value pair is needed for android/ios version to work
    //       'origin': 'http://localhost',
    //       'Content-Type': 'application/json',
    //     },
    //     body: json.encode({
    //       'service_id': serviceId,
    //       'template_id': templateId,
    //       'user_id': userId,
    //       'template_params': {
    //         'user_name': name,
    //         'user_email': email,
    //         'user_subject': subject,
    //         'user_message': message,
    //       }
    //     }),
    //   );
    //   // print(response.body);
    // }

    Future<String?> sendToDB(
      String name,
      String email,
      String subject,
      String message,
    ) async {
      var response = await http.post(
        Uri.parse(endPoint),
        headers: {
          // the origin key value pair is needed for android/ios version to work
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: contactModelToJson(PortfolioContact(
            name: name, email: email, subject: subject, message: message)),
      );

      if (response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        print(response.body);
        return response.body;
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        throw Exception('Failed to send data to the server');
      }
    }

    Widget toast(
            {Color backgroundColor = Colors.greenAccent,
            Color textColor = Colors.black,
            IconData iconData = Icons.check,
            required String text}) =>
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: backgroundColor,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(iconData),
              const SizedBox(
                width: 12.0,
              ),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                ),
              ),
            ],
          ),
        );

    Future<void> trySubmit() async {
      if (_didSubmit) {
        _fToast.showToast(
          child: toast(
              backgroundColor: Colors.redAccent,
              iconData: Icons.error,
              text:
                  "You already submitted a message. Please wait a minute before submitting another one."),
          gravity: ToastGravity.BOTTOM,
          toastDuration: const Duration(seconds: 5),
        );
        // avoid restarting the timer when it has already begun
        if (_alreadyShowingTimeOut) {
          return;
        }

        _alreadyShowingTimeOut = true;

        Future.delayed(const Duration(seconds: CONTACT_MESSAGE_TIMEOUT_SECONDS),
            () {
          _alreadyShowingTimeOut = false;
          _didSubmit = false;
        });

        return;
      }

      // print("form submitted!");
      var name = controllerMap['name']?.text,
          email = controllerMap['email']?.text,
          subject = controllerMap['subject']?.text,
          message = controllerMap['message']?.text;
      if (name!.isEmpty ||
          email!.isEmpty ||
          subject!.isEmpty ||
          message!.isEmpty) {
        _fToast.showToast(
          child: toast(
              iconData: Icons.error,
              backgroundColor: Colors.redAccent,
              text: "All fields are required"),
          gravity: ToastGravity.BOTTOM,
          toastDuration: const Duration(seconds: 5),
        );
        return;
      }

      _didSubmit = true;
      String? res = await sendToDB(name, email, subject, message);
      if (res == 'saved a contact\'s information into the database!') {
        // show to the client that his/her message has been sent
        _fToast.showToast(
          child: toast(
              text:
                  "Thank you for your message! I will respond as soon as possible!"),
          gravity: ToastGravity.BOTTOM,
          toastDuration: const Duration(seconds: 5),
        );
      } else {
        _fToast.showToast(
          child: toast(
              iconData: Icons.error,
              backgroundColor: Colors.redAccent,
              text: "Failed to send message. Please try again later."),
          gravity: ToastGravity.BOTTOM,
          toastDuration: const Duration(seconds: 5),
        );
      }

      // await sendEmail(
      //     name: controllerMap['name']!.text,
      //     email: controllerMap['email']!.text,
      //     subject: controllerMap['subject']!.text,
      //     message: controllerMap['message']!.text);
    }

    return Padding(
      padding: const EdgeInsets.only(
          left: 100.0, top: 32.0, right: 100, bottom: 32.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          child: const Text(
            "I am excited to meet and work with you because we progress better together! Please don't hesitate to contact me using the form below.",
            style: TextStyle(
                color: Colors.white70,
                fontSize: NAV_HEADER_FONT_SIZE,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controllerMap['name'],
                autofocus: true,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "Name",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            Expanded(
              child: TextField(
                controller: controllerMap['email'],
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "Email",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        TextField(
          controller: controllerMap['subject'],
          decoration: const InputDecoration(
            filled: true,
            hintText: "Subject",
            border: InputBorder.none,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        TextField(
          controller: controllerMap['message'],
          maxLines: 7,
          decoration: const InputDecoration(
            filled: true,
            hintText: "Message",
            border: InputBorder.none,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        OnHoverButton(
          child: MaterialButton(
              height: 60.0,
              minWidth: double.infinity,
              color: const Color(0xff333333),
              onPressed: () {
                trySubmit();
              },
              child: const Text(
                "SUBMIT",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              )),
        ),
      ]),
    );
  }
}
