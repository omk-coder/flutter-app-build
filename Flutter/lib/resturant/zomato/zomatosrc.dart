import 'package:flutter/material.dart';
import 'package:mini_project/resturant/swiggy.dart';
import 'package:mini_project/resturant/zomato/zomato.dart';
import '../../Component/headerTop.dart';

class shortlistScreenzo extends StatelessWidget {
  const shortlistScreenzo({super.key});

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
              SizedBox(
                height: 20,
              ),
              shortListDashboardzo(),
            ],
          ),
        ),
      ),
    );
  }
}
