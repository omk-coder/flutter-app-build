import 'package:flutter/material.dart';
import '../Component/downCrd.dart';
import '../Component/headerCard.dart';
import '../Component/headerTop.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
              card(),
              SizedBox(
                height: 20,
              ),
              Downcard(),
            ],
          ),
        ),
      ),
    );
  }
}
