import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void ManageHttpResponse ({

required http.Response response,
required buildContext context ,
required VoidCallback onSUccess
}){

  switch(response.statusCode){

    case 200:
      onSUccess();
      break;
    case 400:
      showSnackBar(context: context , title: jsonDecode(response.body['msg']));
      break;
    case 500:
      showSnackBar(context: context , title: jsonDecode(response.body['error']));
      break;
      case 201:
        onSUccess();
        break;

  }



}


void showSnackBar({BuildContext context , string title}){

  scaffoldMessenger.of(context).showSnackBar(snackBar(content: Text(title)));
}