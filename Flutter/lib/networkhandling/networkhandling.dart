import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class NetwokHandler {
  String baseurl = "http://localhost:3000/";

  Future<dynamic> post(Map<String, String> body) async {
    try {
      var response = await http.post(
        Uri.parse("http://localhost:3000/signup"),
        body: jsonEncode(body),
        headers: {
          "Content-Type": "application/json;charSet=UTF-8",
        },
      );
      if (response.statusCode == 409) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  /*Future<http.Response> loginUser(Map<String, String> body) async {
    try {
    var res = await http.post(
      Uri.parse("http://localhost:3000/signin"),
      headers: {"Accept": "application/json"},
      body: jsonEncode(body),
    );
    if (response.statusCode == 409) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }
}   */

  Future<dynamic> login(Map<String, String> body) async {
    try {
      var response = await http.post(
        Uri.parse("http://localhost:3000/signin"),
        body: jsonEncode(body),
        headers: {
          "Content-Type": "application/json;charSet=UTF-8",
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }
}
