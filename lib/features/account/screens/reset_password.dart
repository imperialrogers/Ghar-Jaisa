// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:flutter/material.dart';
import 'package:project_s4/features/account/services/account_services.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = '/reset-password';

  ResetPasswordScreen({super.key});
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _oldpasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  late String _oldPassword;
  late String _newPassword;
  late String _confirmPassword;

  bool _showOldPassword = false;
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  void changePassword(
      BuildContext context, String oldPassword, String newPassword) async {
    final AccountServices accountServices = AccountServices();
    accountServices.changePassword(context, oldPassword, newPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(10.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.orange,
              size: 30,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            '',
            style: TextStyle(
                color: Color.fromARGB(200, 50, 53, 51),
                fontWeight: FontWeight.w600,
                fontSize: 19),
          ),
        ),
        toolbarHeight: 55,
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 5.0),
                Text(
                  'RESET YOUR PASSWORD',
                  style: TextStyle(
                    color: Color.fromARGB(197, 67, 60, 60),
                    fontWeight: FontWeight.w600,
                    fontSize: 23,
                  ),
                ),
                SizedBox(height: 50.0),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: _oldpasswordController,
                    obscureText: !_showOldPassword,
                    decoration: InputDecoration(
                      hintText: 'Old Password',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey),
                      icon: Icon(Icons.lock, color: Colors.orange),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showOldPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.orange,
                        ),
                        onPressed: () {
                          setState(() {
                            _showOldPassword = !_showOldPassword;
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
                SizedBox(height: 30.0),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: _newPasswordController,
                    obscureText: !_showNewPassword,
                    decoration: InputDecoration(
                      hintText: 'New Password',
                      border: InputBorder.none,
                      icon: Icon(Icons.lock, color: Colors.orange),
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
                        _confirmPassword = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: !_showConfirmPassword,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      icon: Icon(Icons.lock, color: Colors.orange),
                      border: InputBorder.none,
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
                  ),
                ),
                SizedBox(height: 200.0),
                // ElevatedButton(
                //   child:  Text('Reset Password'),
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor:
                //          Color(0xFFfd841f), // Background color
                //   ),
                //   onPressed: () {
                //     if (_formKey.currentState!.validate()) {
                //       // TODO: reset password logic
                //     }
                //   },
                // ),
                ElevatedButton(
                  onPressed: () {
                    changePassword(
                      context,
                      _oldpasswordController.text,
                      _confirmPasswordController.text,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 17),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "RESET PASSWORD",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
