// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:project_s4/common/widgets/custom_button.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class FeedBackScreen extends StatelessWidget {
  static const routeName = '/send-feedback';
  const FeedBackScreen({super.key});

  void sendMail(String body) async {
    final Email email = Email(
      body: body,
      subject: 'FEEDBACK-Reg',
      recipients: ['food-delivery-subsystem@hotmail.com'],
      // cc: ['cc@example.com'],
      // bcc: ['bcc@example.com'],
      // attachmentPaths: ['/path/to/attachment.zip'],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _feedbackController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  color: const Color.fromARGB(255, 253, 242, 234),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 20,
                      color: Color(0xFFfd841f),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text("SEND FEEDBACK",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            SizedBox(
              height: 20,
            ),
            TextField(
              cursorHeight: 25,
              decoration: InputDecoration(
                labelText: "Enter Feedback",
              ),
              controller: _feedbackController,
              keyboardType: TextInputType.multiline,
              cursorColor: Colors.orange,
            ),
            SizedBox(
              height: 50,
            ),
            CustomButton(
                text: "Submit FeedBack",
                onTap: () {
                  sendMail(_feedbackController.text);
                }),
          ],
        ),
      ),
    );
  }
}
