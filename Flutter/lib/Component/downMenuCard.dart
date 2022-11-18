import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DashbordMenu extends StatefulWidget {
  const DashbordMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<DashbordMenu> createState() => _DashbordMenuState();
}

class _DashbordMenuState extends State<DashbordMenu> {
  List<OrderData> getlist = [];

  late Map data;
  late List orderData;

  Future<List<OrderData>> getdata() async {
    final Response = await http.get(Uri.parse('http://localhost:3000/menu'));
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
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
        BoxShadow(
          color: Colors.black,
          offset: const Offset(
            5.0,
            5.0,
          ), //Offset
          blurRadius: 10.0,
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
      height: 630,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      padding: EdgeInsets.all(9),
      child: Column(
        children: [
          Row(
            children: [
              orderHeading("ID"),
              orderHeading("Food"),
              orderHeading("Food_Price"),
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
                        "${orderData[index]["food_id"]}",
                        textAlign: TextAlign.center,
                      )),
                      const SizedBox(
                        height: 40,
                      ),
                      Expanded(
                          child: Text(
                        "${orderData[index]["food_name"]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      )),
                      Expanded(
                          child: Text("${orderData[index]["food_price"]}",
                              textAlign: TextAlign.center)),
                    ],
                  );
                }),
          ),
        ],
      ),
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

class menu {
  List<OrderData>? orderData;

  menu({this.orderData});

  menu.fromJson(Map<String, dynamic> json) {
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
  String? foodId;
  String? foodName;
  String? foodPrice;
  String? date;
  int? iV;

  OrderData(
      {this.sId,
      this.foodId,
      this.foodName,
      this.foodPrice,
      this.date,
      this.iV});

  OrderData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    foodId = json['food_id'];
    foodName = json['food_name'];
    foodPrice = json['food_price'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['food_id'] = this.foodId;
    data['food_name'] = this.foodName;
    data['food_price'] = this.foodPrice;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}
