// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:project_s4/common/screens/congrats.dart';
import 'package:project_s4/constants/error_handling.dart';
import 'package:project_s4/constants/global_variables.dart';
import 'package:project_s4/features/auth/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../constants/utils.dart';
import '../../../providers/user_provider.dart';

class AccountServices {
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
      showSnackBar(context, e.toString());
    }
  }

  void resetPassword(
      BuildContext context, String oldPassword, String newPassword) async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);

      if (oldPassword == newPassword &&
          oldPassword.isNotEmpty &&
          newPassword.isNotEmpty) {
        try {
          http.Response res =
              await http.post(Uri.parse('$uri/change/password'), body: {
            "oldPassword": oldPassword,
            "newPassword": newPassword
          }, headers: <String, String>{
            'Content-Type': 'application/json; chatset=UTF-8',
          });
          httpErrorHandle(
              response: res,
              context: context,
              onSuccess: () async {
                showSnackBar(context, 'UPDATED PASSWORD');

                try {
                  await http.post(
                    Uri.parse('$uri/mail/pass-updated'),
                    headers: {
                      'Content-Type': 'application/json; charset=UTF-8',
                      'x-auth-token': userProvider.user.token,
                    },
                    body: {
                      'email_address': userProvider.user.email,
                      'name': userProvider.user.name
                    },
                  );
                } catch (e) {
                  showSnackBar(context, e.toString());
                }

                Navigator.pushReplacementNamed(context, CongratsPage.routeName,
                    arguments: "Your Password has been update");
              });
        } catch (e) {
          showSnackBar(context, e.toString());
        }
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
