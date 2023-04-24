// ignore_for_file: unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_s4/features/account/services/account_services.dart';

class ChangePassword extends StatefulWidget {
  static const routeName = '/change-password';
  const ChangePassword({Key? key}) : super(key: key);

  @override
  ChangePasswordState createState() => ChangePasswordState();
}

class ChangePasswordState extends State<ChangePassword> {
  final AccountServices accountServices = AccountServices();
  final _formKey = GlobalKey<FormState>();
  String _Pass = '';
  String _rePass = '';
  String _newPass = '';
  final _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    color: const Color.fromARGB(255, 253, 242, 234),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 20,
                        color: Color(0xFFfd841f),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Reset Your Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 30,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Enter your Old and New Passwords to reset your Password.',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    height: 2,
                    fontSize: 15,
                  ),
                ),
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
                      textAlign: TextAlign.left,
                      obscureText: false,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: 'Current Password',
                        hintStyle: const TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.all(30),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Current Passowrd';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _Pass = value!;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'New Password',
                        hintStyle: const TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.all(30),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter New Password Field';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _rePass = value!;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _newPasswordController,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Re-Enter New Password',
                        hintStyle: const TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.all(30),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Phone Number';
                        }
                        if (value != _newPass) {
                          return 'New Password and Re-typed Passwords do not match!';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _newPass = value!;
                      },
                    ),
                    const SizedBox(height: 200.0),
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                            alignment: Alignment.center,
                            overlayColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 255, 196, 148)),
                            backgroundColor: MaterialStatePropertyAll(
                              Color(0xFFfd841f),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              accountServices.resetPassword(
                                context,
                                _Pass.toString(),
                                _newPass.toString(),
                              );
                            }
                          },
                          child: const Text('RESET',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
