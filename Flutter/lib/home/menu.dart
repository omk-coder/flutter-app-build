import 'package:flutter/material.dart';
import 'package:mini_project/home/dashboard.dart';
import 'package:mini_project/home/dashbordmenu.dart';
import 'package:mini_project/home/dashbordorder.dart';
import 'package:mini_project/Component/downCardOrder.dart';

import '../Component/SideMenu.dart';

class menu extends StatefulWidget {
  const menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
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
                child: DashboardMenuScreen(),
                color: Color(0xffe1e6e1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
