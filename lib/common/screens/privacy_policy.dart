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
      body: SingleChildScrollView(
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
            Text(
              'Interpretation',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.',
            ),
            Text(
              'Definitions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.',
            ),
            Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We at XYZ Inc. ("we," "us," "our") respect your privacy and want you to understand how we collect, use, and share data about you. This Privacy Policy covers our data practices when you use our Flutter mobile application ("App").',
            ),
            Text(
              'Data We Collect',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We collect data you provide to us when you use the App, such as your name, email address, and other contact information. We also collect information about your usage of the App, such as the features you use and the actions you take within the App.',
            ),
            Text(
              'How We Use Your Data',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We may use your data to operate and improve the App, to respond to your requests and inquiries, to personalize your experience with the App, and for other purposes consistent with this Privacy Policy. We may also use your data to communicate with you about updates to the App, promotional offers, and other marketing materials. If you do not want to receive such communications, you may opt out at any time.',
            ),
            Text(
              'Sharing of Your Data',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We may share your data with third-party service providers who perform services on our behalf, such as data analytics, customer support, and marketing. We may also share your data with our affiliates or other third parties for their own purposes, such as to provide you with targeted advertising. We may also share your data if required by law or to protect our rights or the rights of others.',
            ),
            Text(
              'Data Security',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We take reasonable measures to protect your data from unauthorized access, alteration, disclosure, or destruction. However, we cannot guarantee the security of your data, and you use the App at your own risk.',
            ),
            Text(
              'Childrens Privacy',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'The App is not intended for use by children under the age of 13, and we do not knowingly collect data from children under the age of 13. If we become aware that we have collected data from a child under the age of 13, we will take steps to delete the data as soon as possible.',
            ),
            Text(
              'Changes to this Privacy Policy',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We may update this Privacy Policy from time to time by posting a new version on our website. We encourage you to review this Privacy Policy periodically for any changes.',
            ),
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'If you have any questions about this Privacy Policy, please contact us at privacy@gmail.com.',
            ),
          ],
        ),
      ),
    );
  }
}
