import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Header extends StatefulWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "dashboard",
          style: Theme.of(context).textTheme.headline6,
        ),
        Spacer(
          flex: 2,
        ),
        Expanded(
          child: SearchField(),
        ),
        ProfileCard(),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: Color.fromARGB(255, 253, 239, 239),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        suffixIcon: InkWell(
          onTap: (() {}),
          child: Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.symmetric(horizontal: 8.0 / 2),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatefulWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  List<OrderData> getlist = [];

  late Map data;

  List? orderData;

  Future<List<OrderData>> getdata() async {
    final Response = await http.get(Uri.parse('http://localhost:3000/rev'));
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
    return Container(
      margin: EdgeInsets.only(left: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0 / 2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.black)),
      child: Row(
        children: [
          Image.asset(
            "assets/images/facebook.png",
            height: 38,
          ),
          Container(
            width: 60,
            height: 20,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0 / 2),
                child: Text("Shahid")),
          ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

//backed
class review {
  List<OrderData>? orderData;

  review({this.orderData});

  review.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? username;
  String? rate;
  String? foodName;
  String? source;
  String? image;
  String? review;
  String? date;
  int? iV;

  OrderData(
      {this.sId,
      this.userId,
      this.username,
      this.rate,
      this.foodName,
      this.source,
      this.image,
      this.review,
      this.date,
      this.iV});

  OrderData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    username = json['username'];
    rate = json['rate'];
    foodName = json['food_name'];
    source = json['source'];
    image = json['image'];
    review = json['review'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['rate'] = this.rate;
    data['food_name'] = this.foodName;
    data['source'] = this.source;
    data['image'] = this.image;
    data['review'] = this.review;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}
