import 'package:flutter/material.dart';
import 'package:mini_project/networkhandling/networkhandling.dart';

import '../dialog.dart';

class menudialog extends StatefulWidget {
  @override
  State<menudialog> createState() => _menudialogState();
}

class _menudialogState extends State<menudialog> {
  postService postservice = postService();

  TextEditingController Food_Name = TextEditingController();

  TextEditingController Food_Price = TextEditingController();

  TextEditingController Food_Code = TextEditingController();

  var food_name = "";
  var food_price = "";
  var food_code = "";

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
                  controller: Food_Name,
                  decoration: InputDecoration(hintText: "Food Name")),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                  controller: Food_Code,
                  decoration: InputDecoration(hintText: "Food_Code")),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                  controller: Food_Price,
                  decoration: InputDecoration(hintText: "Price")),
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
      "food_id": Food_Code.text,
      "food_name": Food_Name.text,
      "food_price": Food_Price.text,
    };
    var res = await postservice.postmenu(data);
    setState(() {
      if (!res) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return dialog("Menu Added", Icons.check_circle);
            });
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return dialog(
                  "food alredy present", Icons.sentiment_very_dissatisfied);
            });
      }
    });
  }
}
