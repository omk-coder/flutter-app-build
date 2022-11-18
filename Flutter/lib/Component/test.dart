import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  List<OrderData> getlist = [];

  late Map data;
  late List orderData;

  Future<List<OrderData>> getdata() async {
    final Response = await http.get(Uri.parse('http://localhost:3000/order'));
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

  Widget build(BuildContext context) {
    return Container(
      width: 550,
      height: 550,
      child: Column(
        children: [
          Row(
            children: [
              orderHeading("ID"),
              orderHeading("Customer_Name"),
              orderHeading("Food"),
              orderHeading("Status")
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
                          child: Text("${orderData[index]["status"]}",
                              textAlign: TextAlign.center)),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  Expanded orderHeading(String text) => Expanded(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
}

class orderdata {
  List<OrderData>? orderData;

  orderdata({this.orderData});

  orderdata.fromJson(Map<String, dynamic> json) {
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
  String? date;
  int? iV;

  OrderData(
      {this.sId,
      this.orderId,
      this.customerName,
      this.food,
      this.status,
      this.date,
      this.iV});

  OrderData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    orderId = json['order_id'];
    customerName = json['customer_name'];
    food = json['food'];
    status = json['status'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['order_id'] = this.orderId;
    data['customer_name'] = this.customerName;
    data['food'] = this.food;
    data['status'] = this.status;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}
