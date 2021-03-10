import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:android1/screens/addmedicinebuttonwidget.dart';
import 'package:android1/screens/viewmedicine.dart';

class Medicine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff9e0091),
      appBar: AppBar(
        title: Text(
          'Medicine:',
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff9e0091),
      ),
      body: Column(
        children: [
          Addmedicinebutton(),
          ViewMedicine(),
        ],
      ),
    );
  }
}
