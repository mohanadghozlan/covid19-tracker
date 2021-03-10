import 'package:android1/screens/editmed.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:android1/screens/addmedicinebuttonwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:android1/models/Medicine.dart' as m;

class ViewMedicine extends StatefulWidget {
  @override
  _ViewMedicineState createState() {
    return _ViewMedicineState();
  }
}

class _ViewMedicineState extends State<ViewMedicine> {
  var email;
  var medicine = new m.Medicine();
  @override
  void initState() {
    super.initState();
  }

  Future<bool> deleteMedicine(medicine) async {
    await FirebaseFirestore.instance
        .collection("Medicine")
        .doc(medicine.name)
        .delete();

    return true;
  }

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
          color: Colors.grey,
        ),
        child: _buildBody(context),
      ),
    ));
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Medicine').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final medicine = m.Medicine.fromSnapshot(data);
    final medicinedate =
        medicine.timestamp.toDate().difference(DateTime.now()).inDays.abs();
    print('name' + medicine.name);
    print('time' + medicine.time);
    return Center(
        child: new SingleChildScrollView(
            child: Container(
                child: ListTile(
      trailing: IconButton(
        onPressed: () {
          deleteMedicine(medicine);
        },
        icon: Icon(Icons.delete),
        color: Colors.red,
      ),
      title: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
          child: FlatButton(
            child: Text(medicine.name),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditMed(medicine)),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 120, 0),
          child: Text(
            'Added $medicinedate Days Ago',
            style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
        )
      ]),
    ))));
  }
}
