import 'package:flutter/material.dart';
import 'package:mini_project/networkhandling/networkhandling.dart';

import '../home/inventoryDash.dart';
import 'addmenu.dart';
import 'downMenuCard.dart';
import 'headerTop.dart';

class inventoryDashboard extends StatelessWidget {
  const inventoryDashboard({super.key});

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
                              return menudialog();
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
    ;
  }
}
