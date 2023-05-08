// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_s4/features/admin/screens/analytics_screen.dart';
import 'package:project_s4/features/admin/screens/posts_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../../auth/screens/login_screen.dart';
import 'orders_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [PostScreen(), OrdersScreen(), AnalyticsScreen()];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin panel',
          style: TextStyle(
              color: Color.fromARGB(182, 0, 0, 0),
              fontWeight: FontWeight.w700,
              fontSize: 22),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white10)),
                onPressed: () => logOut(context),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                  child: Text("SIGN-OUT ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w900)),
                ),
              ),
              IconButton(
                  onPressed: () => logOut(context),
                  icon: Icon(Icons.logout_rounded),
                  color: Colors.orange),
            ],
          ),
        ],
        toolbarHeight: 60,
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          // POSTS
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: 'Home',
          ),
          // ORDER SUMMARY
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.analytics_outlined,
              ),
            ),
            label: 'Orders',
          ),
          //ANALYTICS
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.analytics_outlined,
              ),
            ),
            label: 'Chart',
          ),
        ],
      ),
    );
  }
}

void logOut(BuildContext context) async {
  try {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('x-auth-token', '');
    // ignore: use_build_context_synchronously
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginScreen.routeName,
      (route) => false,
    );
  } catch (e) {
    showSnackBar(context, e.toString(), 0);
  }
}
