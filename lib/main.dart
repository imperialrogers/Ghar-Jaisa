import 'package:flutter/material.dart';
import 'package:project_s4/features/admin/screens/admin_screen.dart';
import 'package:project_s4/features/auth/screens/login_screen.dart';
import 'package:project_s4/features/auth/services/auth_service.dart';
import 'package:project_s4/providers/user_provider.dart';
import 'package:project_s4/screens/fill_bio.dart';
import 'package:provider/provider.dart';
import './common/widgets/bottom_bar.dart';

import './router.dart';
import './features/home/widgets/app_drawer.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ghar Jaisa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFfd841f),
          secondary: const Color.fromARGB(255, 253, 242, 234),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      // home: ChangePassword(),

      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? (Provider.of<UserProvider>(context).user.type == 'user'
              ? (Provider.of<UserProvider>(context).user.verified == 0)
                  ? const FillBio()
                  : const AppDrawer(BottomBar())
              : const AdminScreen())
          : const LoginScreen(),
    );
  }
}
