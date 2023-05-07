import 'dart:convert';

import './utils.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;

    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg'], 0);
      break;

    case 500:
      showSnackBar(context, jsonDecode(response.body)['error'], 0);
      break;

    default:
      showSnackBar(context, (response.body), 0);
  }
}
