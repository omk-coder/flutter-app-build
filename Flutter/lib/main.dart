import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/Component/addmenu.dart';
import 'package:mini_project/Component/downCardOrder.dart';
import 'package:mini_project/Component/test.dart';
import 'package:mini_project/forget.dart';
import 'package:mini_project/home/homes.dart';
import 'package:mini_project/home/order.dart';
import 'package:mini_project/login.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: 'Flutter Login Web',
      home: login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
