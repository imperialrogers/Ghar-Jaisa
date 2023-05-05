import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static const routeName = '/privacy-policy';

  const PrivacyPolicyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.orange,
              size: 30,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            'Privacy & Policy',
            style: TextStyle(
                color: Color.fromARGB(200, 50, 53, 51),
                fontWeight: FontWeight.bold,
                fontSize: 19),
          ),
        ),
        toolbarHeight: 55,
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cancellation and Refund:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Users may cancel an order before it is accepted by the restaurant. If an order has already been accepted by the restaurant, users may not cancel the order. If a user cancels an order before it is accepted by the restaurant, we will issue a refund in accordance with our refund policy.',
            ),
            SizedBox(height: 10),
            Text(
              'Our refund policy is as follows: If an order is canceled before it is accepted by the restaurant, we will issue a full refund. If an order is canceled after it has been accepted by the restaurant, we will issue a partial refund based on the amount of work that has been done by the restaurant.',
            ),
            SizedBox(height: 20),
            Text(
              'Prohibited Conduct:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Users may not use our food delivery app for any illegal or unauthorized purpose. Users may not harass, intimidate, or threaten other users or our employees. Users may not use our app to transmit any viruses, worms, or other malicious software.',
            ),
            SizedBox(height: 20),
            Text(
              'Termination:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We reserve the right to terminate a user\'s account at any time for any reason, including for violation of these terms of usage. If a user\'s account is terminated, they will no longer be able to access the app or place orders through their account.',
            ),
            SizedBox(height: 20),
            Text(
              'Disclaimer of Warranties:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We make no warranties or representations about the accuracy, reliability, completeness, or timeliness of our food delivery app or its content. We do not warrant that our app will be error-free or uninterrupted. Users use our app at their own risk.',
            ),
            SizedBox(height: 20),
            Text(
              'Limitation of Liability:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We are not liable for any indirect, incidental, special, or consequential damages arising out of or in connection with our food delivery app or its content. Our liability is limited to the amount paid by the user for the service.',
            ),
          ],
        ),
      ),
    );
  }
}
