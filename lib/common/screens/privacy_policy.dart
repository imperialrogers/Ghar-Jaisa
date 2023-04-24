import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static const routeName = '/privacy-policy';
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
            'PRIVACY POLICY',
            style: TextStyle(
                color: Color.fromARGB(200, 50, 53, 51),
                fontWeight: FontWeight.w600,
                fontSize: 19),
          ),
        ),
        toolbarHeight: 55,
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "FOOD DELIVERY COMPANY",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 45, color: Colors.black87),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Collection of Personal Information:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'We may collect certain personal information such as name, email address, phone number, and delivery address from users when they create an account, place an order, or contact customer service.\n\nThis information is necessary to provide the requested service and to communicate with the user.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Collection of Non-Personal Information:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'We may collect non-personal information such as device information, IP address, and browsing behavior to improve the user experience and to monitor the performance of the app.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Use of Personal Information:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'We use personal information to provide the requested service, to communicate with the user, and to improve the user experience.\n\nWe may also use personal information for marketing purposes with the user\'s consent.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Disclosure of Personal Information:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'We may disclose personal information to our partners and service providers who assist us in providing the requested service.\n\nWe may also disclose personal information if required by law or if necessary to protect our rights or the rights of others.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Security:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'We take reasonable measures to protect personal information from unauthorized access, use, or disclosure.\n\nHowever, no method of transmission over the internet or method of electronic storage is 100% secure, and we cannot guarantee absolute security.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Updates:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'We may update this privacy policy from time to time.\n\nUsers will be notified of any changes and will have the opportunity to review and accept the updated policy.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Eligibility:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Our food delivery app is designed for users who are at least 18 years old and have the legal capacity to enter into a contract. By using our app, you represent and warrant that you meet these eligibility requirements.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'User Account:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'To use our food delivery app, users must create an account. When creating an account, users must provide accurate and complete information, including their name, email address, and phone number. Users are responsible for maintaining the confidentiality of their account information and for all activities that occur under their account.If a user believes that their account has been compromised, they should contact us immediately at our customer service center. We reserve the right to terminate a users account at any time for any reason, including for violation of these terms of usage.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Ordering and Payment:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'When placing an order through our app, users must provide accurate and complete information, including the delivery address and payment information. Users are responsible for paying for all orders placed through their account. We accept various forms of payment, including credit/debit cards and online payment systems.If there is a problem with an order, users should contact us immediately at our customer service center. We strive to resolve any issues promptly and to the satisfaction of the user.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Delivery:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'We strive to deliver orders in a timely and efficient manner. However, delivery times may vary depending on various factors such as distance, traffic, and weather conditions. Users should be aware that delivery times may be longer during peak hours or during inclement weather.If there is a problem with a delivery, users should contact us immediately at our customer service center. We strive to resolve any issues promptly and to the satisfaction of the user.',
                style: TextStyle(fontSize: 16.0),
              ),
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
      ),
    );
  }
}
