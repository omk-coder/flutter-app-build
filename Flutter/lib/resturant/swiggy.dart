import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mini_project/Component/shortlistcomp.dart';
import 'package:mini_project/resturant/swiggydas.dart';
import 'package:mini_project/resturant/zomato/zomatodas.dart';

import '../customePageRoute.dart';

class shortListDashboardsy extends StatefulWidget {
  const shortListDashboardsy({
    Key? key,
  }) : super(key: key);

  @override
  State<shortListDashboardsy> createState() => _shortListDashboardsyState();
}

class _shortListDashboardsyState extends State<shortListDashboardsy> {
  List<OrderData> getlist = [];

  late Map data;
  late List orderData;

  Future<List<OrderData>> getdata() async {
    final Response = await http.get(
      Uri.parse('http://localhost:3000/order/swiggy'),
    );
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          child: Row(children: [
            Container(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 50,
                width: 140,
                child: ElevatedButton(
                    child: Text("Swiggy"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        side: BorderSide(width: 3, color: Colors.grey),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(20)),
                    onPressed: (() {
                      Navigator.of(context).push(CustomePageRoute(
                          child: shortlistsy(),
                          direction: AxisDirection.up,
                          time: 0));
                    })),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 50,
                width: 140,
                child: ElevatedButton(
                    child: Text("Zomato"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        side: BorderSide(width: 3, color: Colors.grey),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(20)),
                    onPressed: (() {
                      Navigator.of(context).push(CustomePageRoute(
                          child: shortlistzo(),
                          direction: AxisDirection.up,
                          time: 0));
                    })),
              ),
            ),
          ]),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 37, 36, 36),
                  offset: const Offset(
                    5.0,
                    5.0,
                  ), //Offset
                  blurRadius: 8.0,
                  spreadRadius: 1.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
              ]),
          width: 1500,
          height: 680,
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          padding: EdgeInsets.all(9),
          child: Column(
            children: [
              Row(
                children: [
                  orderHeading("ID"),
                  orderHeading("Customer_Name"),
                  orderHeading("Food"),
                  orderHeading("Date"),
                  orderHeading("Status"),
                  orderHeading("Source"),
                  orderHeading("price"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                    itemCount: orderData == null ? 0 : orderData.length,
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemBuilder: (BuildContext context, index) {
                      return Row(
                        children: [
                          Expanded(
                              child: Text(
                            "${orderData[index]["order_id"]}",
                            textAlign: TextAlign.center,
                          )),
                          const SizedBox(
                            height: 40,
                          ),
                          Expanded(
                              child: Text(
                            "${orderData[index]["customer_name"]}",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          )),
                          Expanded(
                              child: Text("${orderData[index]["food"]}",
                                  textAlign: TextAlign.center)),
                          Expanded(
                              child: Text("${orderData[index]["date"]}",
                                  textAlign: TextAlign.center)),
                          Expanded(
                              child: Text("${orderData[index]["status"]}",
                                  textAlign: TextAlign.center)),
                          Expanded(
                              child: Text("${orderData[index]["source"]}",
                                  textAlign: TextAlign.center)),
                          Expanded(
                              child: Text("${orderData[index]["price"]}",
                                  textAlign: TextAlign.center)),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Expanded orderHeading(String text) => Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );

class orederData {
  List<OrderData>? orderData;

  orederData({this.orderData});

  orederData.fromJson(Map<String, dynamic> json) {
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
  String? orderId;
  String? customerName;
  String? food;
  String? status;
  int? price;
  String? date;
  int? iV;
  String? source;

  OrderData(
      {this.sId,
      this.orderId,
      this.customerName,
      this.food,
      this.status,
      this.price,
      this.date,
      this.iV,
      this.source});

  OrderData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    orderId = json['order_id'];
    customerName = json['customer_name'];
    food = json['food'];
    status = json['status'];
    price = json['price'];
    date = json['date'];
    iV = json['__v'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['order_id'] = this.orderId;
    data['customer_name'] = this.customerName;
    data['food'] = this.food;
    data['status'] = this.status;
    data['price'] = this.price;
    data['date'] = this.date;
    data['__v'] = this.iV;
    data['source'] = this.source;
    return data;
  }
}
