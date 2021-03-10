import 'package:android1/screens/medicine.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'tracing.dart';
import 'venues.dart';
import 'symptoms.dart';
import 'countdown.dart';
import 'venues.dart';


class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('covid tracker'),
          backgroundColor: const Color(0xff9e0091),
           actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              }
        ),
                  ],
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    height: 50,
                    padding: EdgeInsets.only(top: 5),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.purple,
                      child: Text('tracker'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Tracing()),
                        );
                      },
                    )),
                Container(
                    height: 50,
                    padding: EdgeInsets.only(top: 5),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.purple,
                      child: Text('risk level'),
                      onPressed: () {},
                    )),
                Container(
                    height: 50,
                    padding: EdgeInsets.only(top: 5),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.purple,
                      child: Text('venues places'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                    )),
                Container(
                    height: 50,
                    padding: EdgeInsets.only(top: 5),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.purple,
                      child: Text('Medicine'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Medicine()),
                        );
                      },
                    )),
                Container(
                    height: 50,
                    padding: EdgeInsets.only(top: 5),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.purple,
                      child: Text('check symptoms'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => symptoms()),
                        );
                      },
                    )),
                Container(
                    height: 50,
                    padding: EdgeInsets.only(top: 5),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.purple,
                      child: Text('self isolation countdown'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => countdown()),
                        );
                      },
                    )),
              ],
            )));
  }
}
