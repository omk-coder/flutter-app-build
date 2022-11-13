import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mini_project/Component/ordermodel.dart';
import 'package:mini_project/Component/test.dart';
import 'package:mini_project/home/order.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:draw_graph/models/feature.dart';
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
    SaleData('Jan', 10),
    SaleData('Feb', 22),
    SaleData('Mar', 21),
    SaleData('Apr', 20),
    SaleData('May', 20)
  ];
  final List<Feature> features = [
    Feature(
      title: "Earning",
      color: Colors.green,
      data: [
        0.4,
        0.2,
        0.9,
        0.5,
        0.6,
        0.4,
        0.4,
        0.2,
        0.5,
        0.7,
        0.4,
        0.3,
        0.4,
        0.2,
        0.6,
        0.5,
        0.6,
        0.4,
        0.1
      ],
    ),
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
                    child: LineGraph(
                      features: features,
                      size: Size(490, 390),
                      labelX: [
                        'Jan',
                        '',
                        'Feb',
                        '',
                        'Mar',
                        '',
                        'Apr',
                        '',
                        'Jun',
                        '',
                        'Jul',
                        '',
                        'Aug',
                        '',
                        'Sep',
                        '',
                        'Oct',
                        '',
                        'Nov',
                        '',
                        'Dec',
                      ],
                      labelY: [
                        '2k',
                        '4k',
                        '6k',
                        '7k',
                        '8k',
                      ],
                      showDescription: true,
                      graphColor: Colors.black87,
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

class SaleData {
  final String month;
  final int day;

  SaleData(this.month, this.day);
}
