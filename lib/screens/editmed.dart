import 'package:flutter/material.dart';
import 'package:android1/screens/editmedicine.dart';
import 'package:android1/models/Medicine.dart' as m;

class EditMed extends StatefulWidget {
  var medicine = new m.Medicine();
  EditMed(this.medicine);
  @override
  _EditMed createState() => _EditMed(medicine);
}

class _EditMed extends State<EditMed> {
  var medicine = new m.Medicine();
  _EditMed(this.medicine);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Medicine '),
        backgroundColor: const Color(0xff9e0091),
      ),
      backgroundColor: const Color(0xff9e0091),
      body: SafeArea(
        child: Container(
          child: new SingleChildScrollView(
              child: Column(children: [
            EditMedicine(this.medicine),
          ])),
        ),
      ),
    );
  }
}
