import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:android1/models/Medicine.dart' as m;
import 'package:date_field/date_field.dart';

final db = FirebaseFirestore.instance;
DateTime selectedDate;

class EditMedicine extends StatefulWidget {
  var medicine = m.Medicine();
  EditMedicine(m.Medicine mm) {
    this.medicine = mm;
  }
  @override
  EditMedicineState createState() {
    return EditMedicineState(this.medicine);
  }
}

DateTime now = new DateTime.now();
DateTime date = new DateTime(now.year, now.month, now.day);

class EditMedicineState extends State<EditMedicine> {
  var medicine;
  EditMedicineState(this.medicine);

  Future<bool> UpdateMedicine(
      medicine, mednamecontroller, selectedDate, medtimecontroller) async {
    await FirebaseFirestore.instance
        .collection("Medicine")
        .doc(mednamecontroller.text)
        .update({
      'day': selectedDate,
      'time': medtimecontroller.text,
    });

    return true;
  }

  Widget UpdateMed() {
    final mednamecontroller = TextEditingController(text: medicine.name);
    final medtimecontroller = TextEditingController(text: medicine.time);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(30, 20, 30, 0)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.0),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff9e0091),
                  offset: Offset(0, 13),
                  blurRadius: 34,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x21329d9c),
                    offset: Offset(0, 13),
                    blurRadius: 34,
                  ),
                ],
              ),
              child: DateTimeFormField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.event_note),
                  labelText: 'Medicine Date',
                ),
                mode: DateTimeFieldPickerMode.date,
                autovalidateMode: AutovalidateMode.always,
                validator: (e) =>
                    (e?.day ?? 0) == null ? 'choose an aproprite date.' : null,
                onDateSelected: (DateTime value) {
                  print(value);
                  selectedDate = value;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x21329d9c),
                    offset: Offset(0, 13),
                    blurRadius: 34,
                  ),
                ],
              ),
              child: TextFormField(
                controller: medtimecontroller,
                style: TextStyle(color: Colors.purple),
                decoration: InputDecoration(
                    labelText: 'Enter Medicine Time',
                    labelStyle: TextStyle(color: Colors.purple),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                      borderRadius: BorderRadius.circular(21.0),
                    )),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.0),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x21329d9c),
                  offset: Offset(0, 13),
                  blurRadius: 34,
                ),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.0),
              gradient: RadialGradient(
                center: Alignment(-0.88, -1.0),
                radius: 1.35,
                colors: [const Color(0xff9e0091), const Color(0xff9e0091)],
                stops: [0.0, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x36329d9c),
                  offset: Offset(15, 15),
                  blurRadius: 40,
                ),
              ],
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    UpdateMedicine(medicine, mednamecontroller, selectedDate,
                        medtimecontroller);
                  }
                  Navigator.pop(context);
                },
                child: Text('Submit'),
              ),
            ),
          )
        ],
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: new SingleChildScrollView(
      child: Container(
        width: 385.1,
        height: 475.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34.0),
            topRight: Radius.circular(34.0),
            bottomRight: Radius.circular(34.0),
            bottomLeft: Radius.circular(34.0),
          ),
          color: Colors.white,
        ),
        child: UpdateMed(),
      ),
    ));
  }
}
