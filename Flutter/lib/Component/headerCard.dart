import 'package:flutter/material.dart';

class card extends StatelessWidget {
  const card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1200,
      child: Wrap(
        runSpacing: 20.0,
        spacing: 20.0,
        alignment: WrapAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 200,
                width: 200,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.credit_score_rounded,
                        size: 40,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text('Order Recived', style: TextStyle(fontSize: 20)),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '9000',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 200,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.credit_score_rounded,
                        size: 40,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text('Order Delivered', style: TextStyle(fontSize: 20)),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '4000',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 200,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.credit_score_rounded,
                        size: 40,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text('Order Pending', style: TextStyle(fontSize: 20)),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '5000',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 200,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.credit_score_rounded,
                        size: 40,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text('Total Earning', style: TextStyle(fontSize: 20)),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '1000',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

