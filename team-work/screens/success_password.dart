import 'package:flutter/material.dart';

class SucessPassword extends StatelessWidget {
  static const routeName = 'SucessPassword';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Congrats!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFFfd841f),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Password Reset Successfull!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next screen or perform other actions.
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFfd841f), // Background color
              ),
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}