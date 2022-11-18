import 'package:flutter/material.dart';
import 'package:mini_project/home/dashboard.dart';

class call extends StatefulWidget {
  const call({super.key});

  @override
  State<call> createState() => _callState();
}

class _callState extends State<call> {
  final List<Widget> _screen = [
    Container(
      child: DashboardScreen(),
    ),
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Row(children: [
           
       ]),


    );
  }
}
