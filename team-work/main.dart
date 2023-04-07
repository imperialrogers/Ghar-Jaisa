import 'package:flutter/material.dart';
import 'package:project_s4/screens/fill_bio.dart';
import './screens/homepage_screen.dart';
import './widgets/app_drawer.dart';
import './screens/congrats.dart';
import './screens/forgot_password.dart';
import './screens/login_screen.dart';

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
        primarySwatch: Colors.blue,
      ),
      //home: AppDrawer(),
      home: CongratsPage(),
      // home: AppDrawer(HomePage()),
      routes: {
        LoginPage.routeName: (ctx) => LoginPage(),
        FillBio.routeName: (ctx) => const FillBio(),
      },
    );
  }
}
