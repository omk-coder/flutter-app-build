import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_project/login.dart';
import 'customePageRoute.dart';
import 'package:mini_project/networkhandling/networkhandling.dart';

import 'dialog.dart';

class signup extends StatelessWidget {
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
              _menuItem(title: 'Sign up', isActive: true),
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
        color: Color.fromRGBO(76, 175, 80, 1),
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
              primary: Color.fromARGB(75, 76, 158, 88), elevation: 0),
          child: Text(
            'Sign In',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(
              CustomePageRoute(
                  child: login(), direction: AxisDirection.right, time: 1),
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
  NetwokHandler netwokHandler = NetwokHandler();

  bool ishidepassword = true;
  bool ishiderpassword = true;
  TextEditingController _password = TextEditingController();
  TextEditingController _rpassword = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController Compa_name = TextEditingController();

  var email = "";
  var Name = "";
  var Cname = "";
  var Password = "";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        Container(
          width: 360,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign up to \n AGREE+',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "If you have an account",
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
                        "Login",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          CustomePageRoute(
                              child: login(),
                              direction: AxisDirection.up,
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
          height: 450,
          width: 400,
          child: Lottie.asset('assets/images/login.json'),
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
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: name,
          decoration: InputDecoration(
            hintText: 'Enter Your Name',
            prefixIcon: Icon(
              Icons.person,
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
        ),
        SizedBox(height: 20),
        TextField(
          controller: Compa_name,
          decoration: InputDecoration(
            hintText: 'Enter Restaurant Name',
            prefixIcon: Icon(
              Icons.business,
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
        ),
        SizedBox(height: 20),
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
                onTap: _visbalOrNot,
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
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: _rpassword,
          obscureText: ishiderpassword,
          decoration: InputDecoration(
            hintText: 'Confirm Password',
            prefixIcon: Icon(
              Icons.password_outlined,
              color: Colors.green,
            ),
            suffixIcon: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: _rvisbalOrNot,
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
        SizedBox(height: 40),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 9, 104, 12),
                spreadRadius: 1,
                blurRadius: 20,
              ),
            ],
          ),
          child: ElevatedButton(
            child: Container(
                width: double.infinity,
                height: 50,
                child: Center(child: Text("Sign In"))),
            onPressed: () {
              final bool isValide =
                  EmailValidator.validate(emailController.text.trim());
              if (!isValide) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialog(
                          "Invalid Email", Icons.sentiment_very_dissatisfied);
                    });
              } else if (name.text.isEmpty) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialog("Name Should not empty",
                          Icons.sentiment_very_dissatisfied);
                    });
              } else if (Compa_name.text.isEmpty) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialog("Resturant Name Should not Empty",
                          Icons.sentiment_very_dissatisfied);
                    });
              } else if (_password.text.length < 8) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialog("Password Should 8 char",
                          Icons.sentiment_very_dissatisfied);
                    });
              } else if (_password.text != _rpassword.text) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialog("Password not match",
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
        SizedBox(height: 40),
        Row(children: [
          Expanded(
            child: Divider(
              color: Colors.grey[300],
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
        ]),
      ],
    );
  }

//========================================snackBar===========================================================//

  void _visbalOrNot() {
    if (ishidepassword == true) {
      ishidepassword = false;
    } else {
      ishidepassword = true;
    }
    setState(() {});
  }

  void _rvisbalOrNot() {
    if (ishiderpassword == true) {
      ishiderpassword = false;
    } else {
      ishiderpassword = true;
    }
    setState(() {});
  }

  send() async {
    Map<String, String> data = {
      "email": emailController.text,
      "name": name.text,
      "Comp_Name": Compa_name.text,
      "password": _password.text,
    };
    var res = await netwokHandler.post(data);
    setState(() {
      if (res) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return dialog(
                  "User Already Present", Icons.sentiment_very_dissatisfied);
            });
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return dialog("User successfully Registered", Icons.check_circle);
            });
      }
    });
  }
}
