import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:mini_project/forget.dart';
import 'package:mini_project/home/homes.dart';
import 'package:mini_project/signup.dart';
import 'package:lottie/lottie.dart';
import 'customePageRoute.dart';
import 'package:mini_project/networkhandling/networkhandling.dart';

import 'dialog.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 8),
        children: [Menu(), Body()],
      ),
    );
  }
}

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _menuItem(title: 'Sign In', isActive: true),
              _registerButton()
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem({String title = 'Title Menu', isActive = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 75),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Column(
          children: [
            Text(
              '$title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.deepPurple : Colors.grey,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            isActive
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 13, 133, 0),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 0, 132, 2), elevation: 0),
          child: Text(
            'Sign up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(
              CustomePageRoute(
                  child: signup(), direction: AxisDirection.left, time: 1),
            );
          },
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController emailController = TextEditingController();
  bool ishidepassword = true;
  TextEditingController _password = TextEditingController();
  NetwokHandler netwokHandler = NetwokHandler();

  void validateEmail() {}

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 360,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign In to \nMy Application',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "If you don't have an account",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "You can",
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      print(MediaQuery.of(context).size.width);
                    },
                    child: TextButton(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          CustomePageRoute(
                              child: signup(),
                              direction: AxisDirection.down,
                              time: 1),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 550,
          width: 450,
          child: Lottie.asset(
            'assets/images/login.json',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 6),
          child: Container(
            width: 320,
            child: _formLogin(),
          ),
        )
      ],
    );
  }

  Widget _formLogin() {
    return Column(
      children: [
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Enter email',
            prefixIcon: Icon(
              Icons.email_outlined,
              color: Colors.green,
            ),
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: TextStyle(fontSize: 12),
            contentPadding: EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          autofillHints: [AutofillHints.email],
        ),
        SizedBox(height: 30),
        TextField(
          controller: _password,
          obscureText: ishidepassword,
          decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: Icon(
              Icons.password_outlined,
              color: Colors.green,
            ),
            suffixIcon: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: (() {
                  if (ishidepassword == true) {
                    ishidepassword = false;
                  } else {
                    ishidepassword = true;
                  }
                  setState(() {});
                }),
                child: Icon(
                  Icons.visibility_off_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: TextStyle(fontSize: 12),
            contentPadding: EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: Text(
                "Forget Password",
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  CustomePageRoute(
                      child: forget(), direction: AxisDirection.right, time: 1),
                );
              },
            ),
          ],
        ),
        SizedBox(height: 40),
        Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 55, 135, 1),
                spreadRadius: 1,
                blurRadius: 20,
              ),
            ],
          ),
          child: ElevatedButton(
            child: Container(
                color: Colors.green,
                width: double.infinity,
                height: 50,
                child: Center(child: Text("Sign In"))),
            onPressed: () {
              final bool isValid =
                  EmailValidator.validate(emailController.text.trim());
              if (!isValid) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialog(
                          "Inalid Email", Icons.sentiment_very_dissatisfied);
                    });
              } else if (_password.text.isEmpty) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialog("Please Enter Pasword",
                          Icons.sentiment_very_dissatisfied);
                    });
              } else {
                send();
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }

//========================================snackBar===========================================================//
  send() async {
    Map<String, String> data = {
      "email": emailController.text,
      "password": _password.text,
    };
    var res = await netwokHandler.login(data);
    setState(() {
      if (res) {
        Navigator.of(context).push(
          CustomePageRoute(
            child: MainScreen(),
            direction: AxisDirection.up,
            time: 1,
          ),
        );
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return dialog("Invalid User", Icons.sentiment_very_dissatisfied);
            });
      }
    });
  }
}
