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

  postmenu(Map<String, String> data) {}
}

/*getOrderData() async {
      
      var response = await http.get(Uri.http('localhost:3000/','order'));
      var jsonData = jsonDecode(response.body);
      List<Order> orders = [];


      for (var i in jsonData) {
        Order order =Order(i['order_id'],i['customer_name'],['food'],['status']);
        orders.add(order);
      }
      print(orders.length);
      return orders;
     }

class Order {
  String order_id;
  String Customer_Name;
  String Food;
  String Status;
  

  Order({
    required this.order_id,
    required this.Customer_Name,
    required this.Food,
    required this.Status,
  });
}   */

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

//delete inventory data

class deletedata {
  Future<dynamic> delete(Map<String, dynamic> body) async {
    try {
      var response = await http.post(
        Uri.parse("http://localhost:3000/inventory/d"),
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
