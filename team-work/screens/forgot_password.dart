import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const routeName = 'SucessPassword';
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _viaSms = false;

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform password reset action with _emailController.text or _phoneController.text.
      if (_viaSms) {
        // Send password reset code via SMS.
      } else {
        // Send password reset link via email.
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.orange,
                    size: 15,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              SizedBox(height: 5.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Select which contact details should we use to  reset your password',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Via Email:',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.email, color: Color(0xFFfd841f)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.grey),
                  cursorColor: Colors.grey,
                  onChanged: (value) {
                    // Do something when the text in the field changes.
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: 'Via Phone Number:',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.sms, color: Color(0xFFfd841f)),
                  ),
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: Colors.grey),
                  cursorColor: Colors.grey,
                  onChanged: (value) {
                    // Do something when the text in the field changes.
                  },
                ),
              ),
              SizedBox(height: 300),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFfd841f), // Background color
                      ),
                      child: Text('Next'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
