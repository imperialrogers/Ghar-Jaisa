// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:project_s4/screens/fill_bio.dart';
import 'package:provider/provider.dart';

import './screens/login_screen.dart';
import './screens/your_account.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ghar Jaisa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFfd841f),
          secondary: Color.fromARGB(255, 253, 242, 234),
        ),
      ),
      home: YourAccountScreen(),
      routes: {
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        FillBio.routeName: (ctx) => const FillBio(),
        YourAccountScreen.routeName: (ctx) => YourAccountScreen(),
      },
    );
  }
}
