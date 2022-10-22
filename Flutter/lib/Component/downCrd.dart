import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mini_project/Component/ordermodel.dart';
import 'package:mini_project/Component/test.dart';
import 'package:mini_project/home/order.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class Downcard extends StatefulWidget {
  const Downcard({
    Key? key,
  }) : super(key: key);

  @override
  State<Downcard> createState() => _DowncardState();
}

class _DowncardState extends State<Downcard> {
  List<SaleData> data1 = [
    SaleData('Jan', 12),
    SaleData('Feb', 22),
    SaleData('Mar', 30),
    SaleData('Apr', 20),
    SaleData('May', 35)
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            height: 490,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 6.0,
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                Text(
                  'Recent Order',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 400,
                  child: ListView(
                    children: [
                      Container(
                        child: Myapp(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 490,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                Text(
                  'Earning Graph',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 440,
                  width: 650,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      title: ChartTitle(text: ''),
                      legend: Legend(
                        isVisible: true,
                      ),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<SaleData, String>>[
                        LineSeries<SaleData, String>(
                          dataSource: data1,
                          xValueMapper: (SaleData sales, _) => sales.month,
                          yValueMapper: (SaleData sales, _) => sales.sale,
                          name: 'Sales',
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Order_short {
  String Customer_Id;
  String Customer_Name;
  String Food;
  String Status;

  Order_short(
      {required this.Customer_Id,
      required this.Customer_Name,
      required this.Food,
      required this.Status});
}

var order = <Order_short>[
  Order_short(
      Customer_Id: "#001",
      Customer_Name: "Aman",
      Food: "Biryani",
      Status: "pending"),
  Order_short(
      Customer_Id: "#002",
      Customer_Name: "Omakr",
      Food: "Pizaa",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#003",
      Customer_Name: "Shyresh",
      Food: "Veg Pullo",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#004",
      Customer_Name: "Aditya",
      Food: "ice-Cream",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#003",
      Customer_Name: "Shyresh",
      Food: "Veg Pullo",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#004",
      Customer_Name: "Aditya",
      Food: "ice-Cream",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#003",
      Customer_Name: "Shyresh",
      Food: "Veg Pullo",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#004",
      Customer_Name: "Aditya",
      Food: "ice-Cream",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#001",
      Customer_Name: "Aman",
      Food: "Biryani",
      Status: "pending"),
  Order_short(
      Customer_Id: "#002",
      Customer_Name: "Omakr",
      Food: "Pizaa",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#003",
      Customer_Name: "Shyresh",
      Food: "Veg Pullo",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#004",
      Customer_Name: "Aditya",
      Food: "ice-Cream",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#003",
      Customer_Name: "Shyresh",
      Food: "Veg Pullo",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#004",
      Customer_Name: "Aditya",
      Food: "ice-Cream",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#003",
      Customer_Name: "Shyresh",
      Food: "Veg Pullo",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#004",
      Customer_Name: "Aditya",
      Food: "ice-Cream",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#001",
      Customer_Name: "Aman",
      Food: "Biryani",
      Status: "pending"),
  Order_short(
      Customer_Id: "#002",
      Customer_Name: "Omakr",
      Food: "Pizaa",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#003",
      Customer_Name: "Shyresh",
      Food: "Veg Pullo",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#004",
      Customer_Name: "Aditya",
      Food: "ice-Cream",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#003",
      Customer_Name: "Shyresh",
      Food: "Veg Pullo",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#004",
      Customer_Name: "Aditya",
      Food: "ice-Cream",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#003",
      Customer_Name: "Shyresh",
      Food: "Veg Pullo",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#004",
      Customer_Name: "Aditya",
      Food: "ice-Cream",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#001",
      Customer_Name: "Aman",
      Food: "Biryani",
      Status: "pending"),
  Order_short(
      Customer_Id: "#002",
      Customer_Name: "Omakr",
      Food: "Pizaa",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#003",
      Customer_Name: "Shyresh",
      Food: "Veg Pullo",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#004",
      Customer_Name: "Aditya",
      Food: "ice-Cream",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#003",
      Customer_Name: "Shyresh",
      Food: "Veg Pullo",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#004",
      Customer_Name: "Aditya",
      Food: "ice-Cream",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#003",
      Customer_Name: "Shyresh",
      Food: "Veg Pullo",
      Status: "Deliver"),
  Order_short(
      Customer_Id: "#004",
      Customer_Name: "Aditya",
      Food: "ice-Cream",
      Status: "Deliver"),
];

class SaleData {
  final String month;
  final double sale;

  SaleData(this.month, this.sale);
}
