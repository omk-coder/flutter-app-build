import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dashbordinventory extends StatefulWidget {
  const Dashbordinventory({
    Key? key,
  }) : super(key: key);

  @override
  State<Dashbordinventory> createState() => _DashbordinventoryState();
}

class _DashbordinventoryState extends State<Dashbordinventory> {
  List<OrderData> getlist = [];

  late Map data;
  late List orderData;

  Future<List<OrderData>> getdata() async {
    final Response =
        await http.get(Uri.parse('http://localhost:3000/inventory'));
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
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
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
                orderHeading("Item_ID"),
                orderHeading("Item_name"),
                orderHeading("Last_Purchase"),
                orderHeading("Avl_Stock"),
                orderHeading("Action"),
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
                          "${orderData[index]["item_id"]}",
                          textAlign: TextAlign.center,
                        )),
                        const SizedBox(
                          height: 40,
                        ),
                        Expanded(
                            child: Text(
                          "${orderData[index]["item_name"]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        )),
                        Expanded(
                            child: Text("${orderData[index]["date"]}",
                                textAlign: TextAlign.center)),
                        Expanded(
                            child: Text("${orderData[index]["avl_stock"]}",
                                textAlign: TextAlign.center)),
                        Expanded(
                          child: Column(
                              children: [Icon(Icons.edit), Icon(Icons.delete)]),
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),
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

class inventory {
  List<OrderData>? orderData;

  inventory({this.orderData});

  inventory.fromJson(Map<String, dynamic> json) {
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
  String? itemId;
  String? avlStock;
  String? date;
  int? iV;

  OrderData({this.sId, this.itemId, this.avlStock, this.date, this.iV});

  OrderData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    itemId = json['item_id'];
    avlStock = json['avl_stock'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['item_id'] = this.itemId;
    data['avl_stock'] = this.avlStock;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}
