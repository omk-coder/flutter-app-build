import 'package:flutter/material.dart';

class dialog extends StatelessWidget {
  final title, icon;
  dialog(this.title, this.icon);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Container(
        width: 400,
        height: 200,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: Icon(
                  icon,
                  size: 60,
                  color: Colors.blue,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Color.fromARGB(255, 0, 214, 237),
                child: SizedBox.expand(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(children: [
                      Text(
                        title,
                        style: TextStyle(
                            color: Color.fromARGB(255, 212, 94, 85),
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Okay"),
                      )
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
