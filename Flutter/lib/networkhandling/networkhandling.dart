import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:mini_project/home/order.dart';

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

class postService {
  String baseurl = "http://localhost:3000/order";

  getdata() async {
    try {
      var response = await http.get(Uri.parse(baseurl));
      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (scoketExecption) {}
  }

  Future<dynamic> postmenu(Map<String, String> body) async {
    try {
      var response = await http.post(
        Uri.parse("http://localhost:3000/addmenu"),
        body: jsonEncode(body),
        headers: {
          "Content-Type": "application/json;charSet=UTF-8",
        },
      );
      if (response.statusCode == 406) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> postInv(Map<String, String> body) async {
    try {
      var response = await http.post(
        Uri.parse("http://localhost:3000/additem"),
        body: jsonEncode(body),
        headers: {
          "Content-Type": "application/json;charSet=UTF-8",
        },
      );
      if (response.statusCode == 406) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }
}
