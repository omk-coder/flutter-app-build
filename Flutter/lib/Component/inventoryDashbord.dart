import 'package:flutter/material.dart';
import 'package:mini_project/networkhandling/networkhandling.dart';
import 'package:http/http.dart' as http;
import '../dialog.dart';
import '../home/inventoryDash.dart';

import 'headerTop.dart';

class inventoryDashboard extends StatefulWidget {
  const inventoryDashboard({super.key});

  @override
  State<inventoryDashboard> createState() => _inventoryDashboardState();
}

class _inventoryDashboardState extends State<inventoryDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Header(),
              SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.topRight,
                child: SizedBox(
                  height: 60,
                  width: 150,
                  child: ElevatedButton(
                      child: Text("ADD"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          side: BorderSide(width: 3, color: Colors.grey),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(20)),
                      onPressed: (() {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return menudialogi();
                            });
                      })),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Dashbordinventory(),
            ],
          ),
        ),
      ),
    );
  }
}

class menudialogi extends StatefulWidget {
  @override
  State<menudialogi> createState() => _menudialogiState();
}

class _menudialogiState extends State<menudialogi> {
  postService postservice = postService();

  TextEditingController item_id = TextEditingController();

  TextEditingController item_name = TextEditingController();

  TextEditingController last_purches = TextEditingController();
  TextEditingController Avl_stock = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Container(
          width: 400,
          height: 400,
          child: Column(children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Expanded(
                child: Text(
                  "ADD MENU",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: TextField(
                  controller: item_id,
                  decoration: InputDecoration(hintText: "item_id")),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                  controller: item_name,
                  decoration: InputDecoration(hintText: "item_name")),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                  controller: Avl_stock,
                  decoration: InputDecoration(hintText: "Avl_stock")),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  side: BorderSide(width: 3, color: Colors.grey),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(20)),
              onPressed: () async {
                sendMenu();

                Navigator.of(context).pop();
              },
              child: Text("Submit"),
            )
          ]),
        ),
      ),
    );
  }

  sendMenu() async {
    Map<String, String> data = {
      "item_id": item_id.text,
      "item_name": item_name.text,
      "avl_stock": Avl_stock.text,
    };
    var res = await postservice.postInv(data);
    setState(() {
      if (!res) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return dialog("Inventory Added", Icons.check_circle);
            });
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return dialog(
                  "item alredy present", Icons.sentiment_very_dissatisfied);
            });
      }
    });
  }
}
