import 'package:flutter/material.dart';
import 'package:mini_project/login.dart';

import 'customePageRoute.dart';

class forget extends StatelessWidget {
  const forget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            CustomePageRoute(child: login(), direction: AxisDirection.right),
          );
        },
        child: Text("Click"),
      ),
    );
  }
}
