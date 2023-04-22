import 'package:flutter/material.dart';
import 'package:project_s4/features/home/screens/home_screen.dart';

class CongratsPage extends StatelessWidget {
  static const routeName = '/congrats';

  final String text;

  const CongratsPage({
    super.key,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 100),
            const Text(
              'Congrats!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFFfd841f),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 200),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next screen or perform other actions.
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFfd841f), // Background color
              ),
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
