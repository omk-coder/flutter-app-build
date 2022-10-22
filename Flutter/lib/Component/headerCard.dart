import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class card extends StatefulWidget {
  const card({
    Key? key,
  }) : super(key: key);

  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {
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
  Widget build(BuildContext context) {
    // Initial Selected Value
    String dropdownvalue = 'Today';

    // List of items in our dropdown menu
    var items = [
      'Month',
      'Year',
      'Today',
    ];

    return SizedBox(
      width: 1200,
      child: Wrap(
        runSpacing: 20.0,
        spacing: 20.0,
        alignment: WrapAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 200,
                width: 200,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.restaurant_menu,
                        color: Colors.green,
                        size: 40,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text('Order Recived', style: TextStyle(fontSize: 20)),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '20',
                        style: TextStyle(fontSize: 30),
                      ),
                      Container(
                        child: DropdownButton(
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 200,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_shipping,
                        color: Colors.green,
                        size: 40,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text('Order Delivered', style: TextStyle(fontSize: 20)),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '20',
                        style: TextStyle(fontSize: 30),
                      ),
                      Container(
                        child: DropdownButton(
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 200,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.pending_actions,
                        color: Colors.green,
                        size: 40,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text('Order Pending', style: TextStyle(fontSize: 20)),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '6',
                        style: TextStyle(fontSize: 30),
                      ),
                      Container(
                        child: DropdownButton(
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 200,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.monetization_on,
                        color: Colors.green,
                        size: 40,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text('Total Earning', style: TextStyle(fontSize: 20)),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '2180',
                        style: TextStyle(fontSize: 30),
                      ),
                      Container(
                        child: DropdownButton(
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
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
