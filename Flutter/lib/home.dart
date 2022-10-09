import 'package:flutter/material.dart';
import 'package:mini_project/forget.dart';

import 'customePageRoute.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                CustomePageRoute(child: login(), direction: AxisDirection.up),
              );
            },
            child: Text("Click"),
          ),
        ),
      ),
    );
  }
}
