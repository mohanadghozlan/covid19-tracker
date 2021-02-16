import 'package:flutter/material.dart';

import 'home.dart';
import 'signin.dart';


class Signup extends StatefulWidget {
  @override
  _State createState() => _State();
}
 
class _State extends State<Signup> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('sign up'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'covid tracker',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20),
                    )),
                    Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
              decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Name'),
          ),
                    ),
                    Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'email',
                      
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                
                Container(
                  height: 50,
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('create account'),
                      onPressed: () {
                        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => home()),
            );
                      },
                    )),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text('Does have account?'),
                      FlatButton(
                        textColor: Colors.blue,
                        child: Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20),
                        ),
                         onPressed: () {
                             Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Signin()),
            );
          },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ))
              ],
            )));
  }
}

 