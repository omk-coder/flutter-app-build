import 'package:flutter/material.dart';
import 'package:mini_project/home/dashboard.dart';

import '../Component/SideMenu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
                child: DashboardScreen(),
                color: Color(0xffe1e6e1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
