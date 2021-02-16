import 'package:flutter/material.dart';



class Tracing extends StatelessWidget{
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Covid Tracker'),
          actions: <Widget>[
          IconButton(
            icon: Icon(
                Icons.settings,
                size:30,
                color: Colors.white,
      ),
      onPressed: () {
          //settings
      },
    )
  ],
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Tracing',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
               
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Location Here',
                    ),
                  ),
                ), 
                Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Search Location'),
                      onPressed: () {
                        //autosuggestion for locations
                      },
                    )),
                    
                  
                 
              ],
            )));
  }
}
