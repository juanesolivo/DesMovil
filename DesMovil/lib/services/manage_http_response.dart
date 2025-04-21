import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void manageHttpResponse({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 201:
      onSuccess();
      break;
    case 400:
      showSnackBar(context: context, title: jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnackBar(context: context, title: jsonDecode(response.body)['error']);
      break;
  }
}

void showSnackBar({required BuildContext context, required String title}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}