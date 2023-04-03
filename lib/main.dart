import 'package:flutter/material.dart';
import 'package:project_s4/screens/fill_bio.dart';
import 'package:provider/provider.dart';
import './screens/homepage_screen.dart';
import './widgets/app_drawer.dart';

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
      // home: HomePage(),
      home: AppDrawer(HomePage()),
      routes: {
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        FillBio.routeName: (ctx) => const FillBio(),
      },
    );
  }
}
