// ignore_for_file: dead_code, no_leading_underscores_for_local_identifiers, unused_import, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    //FUNCTIONS

    void signIn() {
      // implement your sign in logic here
    }

    void signUp() {
      // implement your sign up logic here
    }

    //VARIABLES

    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    bool _isSignIn = true;

    //SCAFFOLD

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  // Navigate to the login page
                },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold)
                    // Text Color
                    ),
                child: const Text('Login to your account'),
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _isSignIn ? signIn() : signUp();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFfd841f), // Background color
                ),
                child: Text(_isSignIn ? 'Sign In' : 'Sign Up'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isSignIn = !_isSignIn;
                  });
                },
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFFfd841f), // Text Color
                ),
                child: Text(
                  _isSignIn
                      ? 'Don\'t have an account? Sign up.'
                      // ignore: dead_code
                      : 'Already have an account? Sign in.',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
