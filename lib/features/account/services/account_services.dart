// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_s4/constants/global_variables.dart';
import 'package:project_s4/features/auth/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../common/widgets/bottom_bar.dart';
import '../../../constants/error_handling.dart';
import '../../../constants/utils.dart';
import '../../../models/orders.dart';
import '../../../providers/user_provider.dart';

class AccountServices {
  Future<List<Order>> fetchMyOrders({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Order> orderList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/orders/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            orderList.add(
              Order.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString(), 0);
    }
    return orderList;
  }

  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginScreen.routeName,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString(), 0);
    }
  }

  void changePassword(
      BuildContext context, String oldPassword, String newPassword) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      http.Response res = await http.post(Uri.parse('$uri/api/reset-password'),
          body:
              jsonEncode({'password': oldPassword, 'newPassword': newPassword}),
          headers: <String, String>{
            'Content-Type': 'application/json; chatset=UTF-8',
            'x-auth-token': token!
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            //Saving Data
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            //send mail

            try {
              await http.get(Uri.parse('$uri/mail/updated-password'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; chatset=UTF-8',
                  });
            } catch (e) {
              showSnackBar(context, e.toString(), 0);
            }
            //Navigating to the Home Screen
            Navigator.pushNamed(
              context,
              BottomBar.routeName,
            );
            showSnackBar(context, "PASSWORD UPDATED SUCCESSFULLY", 1);
          });
    } catch (e) {
      showSnackBar(context, e.toString(), 0);
    }
  }

  void updateCredentials(
    BuildContext context,
    String fname,
    String lname,
    String address,
  ) async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final user = userProvider.user;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      http.Response res = await http.post(
          Uri.parse('$uri/api/change-crendentials'),
          body: jsonEncode({
            'email': user.email,
            'fname': fname,
            'lname': lname,
            'address': address
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; chatset=UTF-8',
            'x-auth-token': token!
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            try {
              await http.get(Uri.parse('$uri/mail/updated-credentials'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; chatset=UTF-8',
                  });
              showSnackBar(context, "PROFILE UPDATED SUCCESSFULLY", 1);
            } catch (e) {
              showSnackBar(context, e.toString(), 0);
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString(), 0);
    }
  }

  void updateAddress(
    BuildContext context,
    String address,
  ) async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final user = userProvider.user;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      http.Response res = await http.post(Uri.parse('$uri/api/change-address'),
          body: jsonEncode({'address': address}),
          headers: <String, String>{
            'Content-Type': 'application/json; chatset=UTF-8',
            'x-auth-token': token!
          });
      httpErrorHandle(response: res, context: context, onSuccess: () async {});
    } catch (e) {
      showSnackBar(context, e.toString(), 0);
    }
  }
}
