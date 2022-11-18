import 'package:flutter/material.dart';
import '../Component/headerCard.dart';
import '../Component/headerTop.dart';
import '../Component/downCardOrder.dart';
import '../Component/shortlistcomp.dart';

class shortlistScreen extends StatelessWidget {
  const shortlistScreen({super.key});

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
              shortListDashboard(),
            ],
          ),
        ),
      ),
    );
  }
}
