import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:date_field/date_field.dart';

class AddMedicine extends StatefulWidget {
  @override
  AddMedicineState createState() {
    return AddMedicineState();
  }
}

DateTime now = new DateTime.now();
DateTime date = new DateTime(now.year, now.month, now.day);
DateTime selectedDate;

class AddMedicineState extends State<AddMedicine> {
  Future<bool> createMedicine(
      mednamecontroller, selectedDate, medtimecontroller) async {
    print('name' + mednamecontroller.text);
    print('day' + meddaycontroller.text);
    print('time' + medtimecontroller.text);
    await FirebaseFirestore.instance
        .collection('Medicine')
        .doc(mednamecontroller.text)
        .set({
      'name': mednamecontroller.text,
      'day': selectedDate,
      'time': medtimecontroller.text,
      'timestamp': date
    }); //setData take a map as input
    return true;
  }

  final mednamecontroller = TextEditingController();
  final meddaycontroller = TextEditingController();
  final medtimecontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
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
            child: TextFormField(
              controller: mednamecontroller,
              style: TextStyle(color: Colors.purple),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                  labelText: 'Enter Medicine Name',
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
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
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
                colors: [const Color(0xffffffff), const Color(0xffffffff)],
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
                    createMedicine(
                        mednamecontroller, selectedDate, medtimecontroller);
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
}
