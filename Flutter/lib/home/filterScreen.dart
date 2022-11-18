import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class feedback extends StatefulWidget {
  const feedback({super.key});

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  List<OrderData> getlist = [];

  late Map data;
  List? orderData;
  Future<List<OrderData>> getdata() async {
    final Response = await http.get(Uri.parse('http://localhost:3000/rev'));
    var data = json.decode(Response.body.toString());

    setState(() {
      orderData = data['orderData'];
    });

    debugPrint(orderData.toString());
    return data;
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: orderData?.length,
        itemBuilder: (context, index) {
          return Container(
            child: Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                height: 220,
                width: double.maxFinite,
                child: Card(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, bottom: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            "${orderData?[index]["image"]}",
                          ),
                          radius: 30,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 50, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${orderData?[index]["username"]}",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text("${orderData?[index]["food_name"]}"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${orderData?[index]["rate"]}/5",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    " ${orderData?[index]["source"]}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text("${orderData?[index]["review"]}"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  elevation: 5,
                ),
              ),
            ),
          );
        });
  }
}

class review {
  List<OrderData>? orderData;

  review({this.orderData});

  review.fromJson(Map<String, dynamic> json) {
    if (json['orderData'] != null) {
      orderData = <OrderData>[];
      json['orderData'].forEach((v) {
        orderData!.add(new OrderData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderData != null) {
      data['orderData'] = this.orderData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderData {
  String? sId;
  String? userId;
  String? username;
  String? rate;
  String? foodName;
  String? source;
  String? image;
  String? review;
  String? date;
  int? iV;

  OrderData(
      {this.sId,
      this.userId,
      this.username,
      this.rate,
      this.foodName,
      this.source,
      this.image,
      this.review,
      this.date,
      this.iV});

  OrderData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    username = json['username'];
    rate = json['rate'];
    foodName = json['food_name'];
    source = json['source'];
    image = json['image'];
    review = json['review'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['rate'] = this.rate;
    data['food_name'] = this.foodName;
    data['source'] = this.source;
    data['image'] = this.image;
    data['review'] = this.review;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}
