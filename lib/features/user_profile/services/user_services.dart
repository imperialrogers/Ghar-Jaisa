// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_s4/constants/error_handling.dart';
import 'package:project_s4/constants/global_variables.dart';
import 'package:project_s4/constants/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  void changeCredentials(
      {required String fname,
      required String address,
      required String lname,
      required BuildContext context}) async {
    final String name = fname + " " + lname;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      http.Response res = await http.post(
          Uri.parse('$uri/api/change/credentials'),
          body: jsonEncode({'name': name, 'address': address}),
          headers: <String, String>{
            'Content-Type': 'application/json; chatset=UTF-8',
            'x-auth-token': token!
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            showSnackBar(context, 'Successfully Changed Crendentials');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
