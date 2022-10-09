import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_project/Component/SideMenu.dart';

class menu extends StatelessWidget {
  const menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: 1000,
                child: Lottie.asset('assets/images/update.json'),
                color: Color(0xffe1e6e1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
