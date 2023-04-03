import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  static const routeName = 'ResetPassword';
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  late String _newPassword;
  late String _confirmPassword;

  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              Text(
                'Reset your password here',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextField(
                  obscureText: !_showNewPassword,
                  decoration: InputDecoration(
                    hintText: 'New Password',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showNewPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.orange,
                      ),
                      onPressed: () {
                        setState(() {
                          _showNewPassword = !_showNewPassword;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.grey,
                  onChanged: (value) {
                    setState(() {
                      _newPassword = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 12.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextField(
                  obscureText: !_showConfirmPassword,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.orange,
                      ),
                      onPressed: () {
                        setState(() {
                          _showConfirmPassword = !_showConfirmPassword;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.grey,
                  onChanged: (value) {
                    setState(() {
                      _confirmPassword = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 330.0),
              ElevatedButton(
                child: Text('Reset Password'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFfd841f), // Background color
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: reset password logic
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
