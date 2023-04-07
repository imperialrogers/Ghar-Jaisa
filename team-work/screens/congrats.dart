import 'package:flutter/material.dart';

class CongratsPage extends StatelessWidget {
  static const routeName = 'Congrats';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 100),
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
              'Your profile is now ready to use!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 200),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next screen or perform other actions.
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFfd841f), // Background color
              ),
              child: Text('Try Order'),
            ),
          ],
        ),
      ),
    );
  }
}
