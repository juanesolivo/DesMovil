// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  final String id;
  final String fullName;
  final String email;
  final String password;
  final String state;
  final String city;
  final String token;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.state,
    required this.city,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    fullName: json["fullName"],
    email: json["email"],
    password: json["password"],
    state: json["state"],
    city: json["city"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "email": email,
    "password": password,
    "state": state,
    "city": city,
    "token": token,
  };
}
