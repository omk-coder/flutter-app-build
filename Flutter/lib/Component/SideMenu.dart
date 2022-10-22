import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mini_project/Component/headerCard.dart';
import 'package:mini_project/home/dashboard.dart';
import 'package:mini_project/home/homes.dart';
import 'package:mini_project/home/inventoy.dart';
import 'package:mini_project/home/menu.dart';
import 'package:mini_project/home/order.dart';
import 'package:mini_project/login.dart';

import '../customePageRoute.dart';
import '../filter.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: ProfileAvatar(),
            ),
            DrawerListTile(
                icon: Icons.dashboard,
                title: "Dashboard",
                press: () {
                  Navigator.of(context).push(CustomePageRoute(
                      child: MainScreen(),
                      direction: AxisDirection.up,
                      time: 0));
                }),
            DrawerListTile(
              icon: Icons.shopping_cart,
              title: "Order",
              press: () {
                Navigator.of(context).push(CustomePageRoute(
                    child: order(), direction: AxisDirection.up, time: 0));
              },
            ),
            DrawerListTile(
              icon: Icons.inventory,
              title: "Inventory",
              press: () {
                Navigator.of(context).push(CustomePageRoute(
                    child: invet(), direction: AxisDirection.right, time: 0));
              },
            ),
            DrawerListTile(
              icon: Icons.menu_book,
              title: "Menu",
              press: () {
                Navigator.of(context).push(CustomePageRoute(
                    child: menu(), direction: AxisDirection.right, time: 0));
              },
            ),
            DrawerListTile(
              icon: Icons.filter_alt,
              title: "Report",
              press: () {
                Navigator.of(context).push(CustomePageRoute(
                    child: filter(), direction: AxisDirection.right, time: 0));
              },
            ),
            SizedBox(
              height: 300,
            ),
            Container(
              child: Column(children: [
                DrawerListTile(
                  icon: Icons.settings,
                  title: "Setting",
                  press: () {},
                ),
                DrawerListTile(
                  icon: Icons.logout,
                  title: "Sign out",
                  press: () {
                    Navigator.of(context).push(CustomePageRoute(
                        child: login(),
                        direction: AxisDirection.right,
                        time: 0));
                  },
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.press,
    required this.icon,
  }) : super(key: key);
  final String title;
  final icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        width: 100,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Material(
              color: Colors.green,
              shape: CircleBorder(),
              child: Container(
                padding: EdgeInsets.all(5),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.trvl-media.com/hotels/6000000/5230000/5222100/5222076/045fe4a4_z.jpg'),
                  radius: 50,
                ),
              ),
            ),
            Positioned(
              right: 1,
              bottom: 30,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration:
                    BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
