import 'package:flutter/material.dart';

class YourAccountScreen extends StatelessWidget {
  static const routeName = '/your-accounts';

  @override
  Widget build(BuildContext context) {
    String name = 'Test Test';
    String bio = 'this is a test string';
    String imageUrl =
        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fvectors%2Fblank-profile-picture-mystery-man-973460%2F&psig=AOvVaw3_ZAwnQYrN0tT4njt66Pc-&ust=1679899772558000&source=images&cd=vfe&ved=0CA0QjRxqFwoTCKDhocCA-f0CFQAAAAAdAAAAABAD';
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 40,
                  width: double.infinity,
                ),
                const Positioned(
                  bottom: 20,
                  right: 20,
                  child: Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 246, 245, 245),
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Test Test',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'youremail@doimain.com',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Color.fromARGB(255, 180, 179, 179)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  '0123456789',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Color.fromARGB(255, 180, 179, 179)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Your address',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Color.fromARGB(255, 180, 179, 179)),
                ),
              ),
            ),
            Column(
              children: [
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.discount),
                      Text('You have  vouchers'),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
