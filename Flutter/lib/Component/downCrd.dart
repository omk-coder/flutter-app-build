import 'package:flutter/material.dart';
import 'package:mini_project/home/order.dart';

class Downcard extends StatefulWidget {
  const Downcard({
    Key? key,
  }) : super(key: key);

  @override
  State<Downcard> createState() => _DowncardState();
}

class _DowncardState extends State<Downcard> {
  Widget bodydata() => DataTable(
        columns: <DataColumn>[
          DataColumn(
            label: Text(
              "Customer_Id",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            numeric: false,
          ),
          DataColumn(
            label: Text(
              "Customer_Name",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            numeric: false,
          ),
          DataColumn(
            label: Text(
              "Food",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            numeric: false,
          ),
          DataColumn(
            label: Text(
              "Status",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          )
        ],
        rows: order
            .map((order) => DataRow(cells: [
                  DataCell(Text(order.Customer_Id)),
                  DataCell(Text(order.Customer_Name)),
                  DataCell(Text(order.Food)),
                  DataCell(Text(order.Status)),
                ]))
            .toList(),
      );
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
                        child: bodydata(),
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
                  height: 200,
                  child: Text('heyy'),
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
