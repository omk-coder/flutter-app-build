import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project/Component/headerTop.dart';
import 'package:mini_project/dialog.dart';
import 'package:mini_project/networkhandling/networkhandling.dart';

class Dashbordshort extends StatefulWidget {
  const Dashbordshort({
    Key? key,
  }) : super(key: key);

  @override
  State<Dashbordshort> createState() => _DashbordshortState();
}

class _DashbordshortState extends State<Dashbordshort> {
  NetwokHandler netwokHandler = NetwokHandler();
  late TextEditingController idcontroler;

  Future deletDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Delet"),
          content: TextField(
            decoration: InputDecoration(hintText: 'Item_id'),
            controller: idcontroler,
          ),
          actions: [
            TextButton(
                onPressed: (() {
                  Navigator.of(context).pop();
                }),
                child: Text('Submit'))
          ],
        ),
      );

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

  Future<OrderData> delteinv(String id) async {
    final delet = Uri.parse("http://localhost:3000/d/$id");
    final response = await http.delete(
      Uri.parse("http://localhost:3000/d/$id"),
      headers: {
        "Content-Type": "application/json;charSet=UTF-8",
      },
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${data['item_name']}delete scusseful..')));
    } else if (response.statusCode == 400) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('erro')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('dont no')));
    }
    return data;
  }

  @override
  void initState() {
    super.initState();
    getdata();
    idcontroler = TextEditingController();
  }

  @override
  void dispose() {
    idcontroler.dispose();
    super.dispose();
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
                  itemCount: orderData.length,
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemBuilder: (BuildContext context, index) {
                    return Row(
                      children: [
                        Expanded(
                            child: Text(
                          "#${orderData[index]["item_id"]}",
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
                            child: Text("${orderData[index]["date"]}".trim(),
                                textAlign: TextAlign.center)),
                        Expanded(
                            child: Text("${orderData[index]["avl_stock"]}",
                                textAlign: TextAlign.center)),
                        Expanded(
                          child: Column(
                            children: [
                              ElevatedButton(
                                  onPressed: (() {
                                    setState(() {
                                      delteinv(
                                          orderData[index]["id"].toString());
                                    });
                                  }),
                                  child: Icon(Icons.delete)),
                            ],
                          ),
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
