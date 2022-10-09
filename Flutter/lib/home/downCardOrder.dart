import 'package:flutter/material.dart';
import 'package:mini_project/home/order.dart';

class DashbordOrderDown extends StatefulWidget {
  const DashbordOrderDown({
    Key? key,
  }) : super(key: key);

  @override
  State<DashbordOrderDown> createState() => _DashbordOrderDownState();
}

class _DashbordOrderDownState extends State<DashbordOrderDown> {
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
              "Delivery_Date",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          DataColumn(
            label: Text(
              "Delivery_Time",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          DataColumn(
            label: Text(
              "Source",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          DataColumn(
            label: Text(
              "Status",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          DataColumn(
            label: Text(
              "Recept",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          DataColumn(
            label: Text(
              "Track",
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
                  DataCell(Text(order.deliver_Date)),
                  DataCell(Text(order.deliver_time)),
                  DataCell(Text(order.Source)),
                  DataCell(Text(order.Status)),
                  DataCell(Text(order.Recept)),
                  DataCell(Text(order.Track)),
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
                  'ALL ORDERS',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
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
      ],
    );
    ;
  }
}

class Order_short {
  String Customer_Id;
  String Customer_Name;
  String Food;
  String deliver_Date;
  String deliver_time;
  String Source;
  String Status;
  String Recept;
  String Track;

  Order_short({
    required this.Customer_Id,
    required this.Customer_Name,
    required this.Food,
    required this.deliver_Date,
    required this.deliver_time,
    required this.Source,
    required this.Status,
    required this.Recept,
    required this.Track,
  });
}

var order = <Order_short>[
  Order_short(
      Customer_Id: "#001",
      Customer_Name: "Aman",
      Food: "Biryani",
      deliver_Date: "12-06-2022",
      deliver_time: "12:00",
      Source: 'Suigii',
      Status: "pending",
      Recept: "pdf",
      Track: "link"),
  Order_short(
      Customer_Id: "#001",
      Customer_Name: "Aman",
      Food: "Biryani",
      deliver_Date: "12-06-2022",
      deliver_time: "12:00",
      Source: 'Suigii',
      Status: "pending",
      Recept: "pdf",
      Track: "link"),
  Order_short(
      Customer_Id: "#001",
      Customer_Name: "Aman",
      Food: "Biryani",
      deliver_Date: "12-06-2022",
      deliver_time: "12:00",
      Source: 'Suigii',
      Status: "pending",
      Recept: "pdf",
      Track: "link"),
  Order_short(
      Customer_Id: "#001",
      Customer_Name: "Aman",
      Food: "Biryani",
      deliver_Date: "12-06-2022",
      deliver_time: "12:00",
      Source: 'Suigii',
      Status: "pending",
      Recept: "pdf",
      Track: "link"),
  Order_short(
      Customer_Id: "#001",
      Customer_Name: "Aman",
      Food: "Biryani",
      deliver_Date: "12-06-2022",
      deliver_time: "12:00",
      Source: 'Suigii',
      Status: "pending",
      Recept: "pdf",
      Track: "link"),
  Order_short(
      Customer_Id: "#001",
      Customer_Name: "Aman",
      Food: "Biryani",
      deliver_Date: "12-06-2022",
      deliver_time: "12:00",
      Source: 'Suigii',
      Status: "pending",
      Recept: "pdf",
      Track: "link"),
  Order_short(
      Customer_Id: "#001",
      Customer_Name: "Aman",
      Food: "Biryani",
      deliver_Date: "12-06-2022",
      deliver_time: "12:00",
      Source: 'Suigii',
      Status: "pending",
      Recept: "pdf",
      Track: "link"),
  Order_short(
      Customer_Id: "#001",
      Customer_Name: "Aman",
      Food: "Biryani",
      deliver_Date: "12-06-2022",
      deliver_time: "12:00",
      Source: 'Suigii',
      Status: "pending",
      Recept: "pdf",
      Track: "link"),
  Order_short(
      Customer_Id: "#001",
      Customer_Name: "Aman",
      Food: "Biryani",
      deliver_Date: "12-06-2022",
      deliver_time: "12:00",
      Source: 'Suigii',
      Status: "pending",
      Recept: "pdf",
      Track: "link"),
  Order_short(
      Customer_Id: "#001",
      Customer_Name: "Aman",
      Food: "Biryani",
      deliver_Date: "12-06-2022",
      deliver_time: "12:00",
      Source: 'Suigii',
      Status: "pending",
      Recept: "pdf",
      Track: "link"),
  Order_short(
      Customer_Id: "#001",
      Customer_Name: "Aman",
      Food: "Biryani",
      deliver_Date: "12-06-2022",
      deliver_time: "12:00",
      Source: 'Suigii',
      Status: "pending",
      Recept: "pdf",
      Track: "link"),
];
