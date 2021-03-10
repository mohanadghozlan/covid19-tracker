import 'package:flutter/material.dart';
import 'package:android1/screens/addmedicine.dart';

class AddMed extends StatefulWidget {
  @override
  _AddMed createState() => _AddMed();
}

class _AddMed extends State<AddMed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Medicine '),
        backgroundColor: const Color(0xff9e0091),
      ),
      backgroundColor: const Color(0xff9e0091),
      body: SafeArea(
        child: Container(
          child: new SingleChildScrollView(
              child: Column(children: [
            AddMedicine(),
          ])),
        ),
      ),
    );
  }
}
