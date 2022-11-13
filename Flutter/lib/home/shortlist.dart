import 'package:flutter/material.dart';
import 'package:mini_project/home/dashboard.dart';
import 'package:mini_project/home/dashbordorder.dart';
import 'package:mini_project/Component/downCardOrder.dart';
import 'package:mini_project/home/shortlistscreen.dart';

import '../Component/SideMenu.dart';

class shortlist extends StatelessWidget {
  const shortlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe1e6e1),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SideMenu(),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: shortlistScreen(),
                color: Color(0xffe1e6e1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
