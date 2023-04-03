import 'package:flutter/material.dart';

class FillBio extends StatefulWidget {
  static const routeName = '/fill-bio';
  const FillBio({Key? key}) : super(key: key);

  @override
  FillBioState createState() => FillBioState();
}

class FillBioState extends State<FillBio> {
  final _formKey = GlobalKey<FormState>();
  String _firstName = '';
  String _lastName = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            'Fill in Your Bio to get started',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 27,
            ),
            // textAlign: TextAlign.left,
          ),
          const SizedBox(height: 20),
          const Text(
            'This data will be displayed in your account profile for your security',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _firstName = value!;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _lastName = value!;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    style: const ButtonStyle(
                      overlayColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 255, 196, 148)),
                      backgroundColor: MaterialStatePropertyAll(
                        Color(0xFFfd841f),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Save account details to database or perform other actions here
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
