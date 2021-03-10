import 'package:android1/screens/addmed.dart';
import 'package:flutter/material.dart';
import 'package:android1/screens/addmedicine.dart';

class Addmedicinebutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 70,
      color: const Color(0xffe0ecde),
      margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 0.0, bottom: 10.0),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 5.0,
            top: 0.0,
            right: 0.0,
            bottom: 0.0,
          ),
          child: FlatButton(
            child: Text(
              'Add Medicine',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddMed()),
              );
            },
          ),
        ),
      ]),
    );
  }
}
