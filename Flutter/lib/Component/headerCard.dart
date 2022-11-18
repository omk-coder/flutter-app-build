import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project/Component/downMenuCard.dart';

class card extends StatefulWidget {
  const card({
    Key? key,
  }) : super(key: key);

  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {
  Future<List<OrderData>> getdata() async {
    final Response = await http.get(Uri.parse('http://localhost:3000/forder'));
    var data = json.decode(Response.body.toString());

    var menuarray = data['count'];
    List<OrderData> ordes = [];
    for (var menu in menuarray) {
      OrderData order = OrderData(
          orderId: menu['order_id'],
          customerName: menu['customer_nme'],
          food: menu['food'],
          date: menu['date'],
          source: menu['source'],
          price: menu['price']);
      ordes.add(order);
    }
    return ordes;
  }

  Future<List<OrderData>> getpdata() async {
    final Response = await http.get(Uri.parse('http://localhost:3000/fporder'));
    var data = json.decode(Response.body.toString());

    var menuarray = data['count'];
    List<OrderData> ordes = [];
    for (var menu in menuarray) {
      OrderData order = OrderData(
          orderId: menu['order_id'],
          customerName: menu['customer_nme'],
          food: menu['food'],
          date: menu['date'],
          source: menu['source'],
          price: menu['price']);
      ordes.add(order);
    }
    return ordes;
  }

  Future<List<OrderData>> getalldata() async {
    final Response = await http.get(Uri.parse('http://localhost:3000/order'));
    var data = json.decode(Response.body.toString());

    var menuarray = data['orderData'];
    List<OrderData> ordes = [];
    for (var menu in menuarray) {
      OrderData order = OrderData(
          orderId: menu['order_id'],
          customerName: menu['customer_nme'],
          food: menu['food'],
          date: menu['date'],
          source: menu['source'],
          price: menu['price']);

      ordes.add(order);
    }
    return ordes;
  }

  List? prisedata;
  Future<Prise> getodata() async {
    final Response =
        await http.get(Uri.parse('http://localhost:3000/fcalrder'));

    var data = json.decode(Response.body.toString());
    prisedata = data['orderData'];
    setState(() {
      return prisedata = data['orderData'];
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 1200,
        child: Center(
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
                          Container(
                            child: FutureBuilder<List<OrderData>>(
                                future: getalldata(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return const Center(
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: Text(
                                        snapshot.data!.length.toString(),
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  }
                                }),
                          ),
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
                          Text('Order Delivered',
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            child: FutureBuilder<List<OrderData>>(
                                future: getdata(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return const Center(
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: Text(
                                        snapshot.data!.length.toString(),
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  }
                                }),
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
                          Container(
                            child: FutureBuilder<List<OrderData>>(
                                future: getpdata(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return const Center(
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: Text(
                                        snapshot.data!.length.toString(),
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  }
                                }),
                          ),
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
                          Container(
                            height: 45,
                            child: Text(
                              "1330",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
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
        ));
  }
}

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

class Prise {
  final int id;
  final int price;

  const Prise({required this.id, required this.price});

  factory Prise.fromJson(Map<String, dynamic> json) {
    return Prise(
      id: json['id'],
      price: json['price'],
    );
  }
}
