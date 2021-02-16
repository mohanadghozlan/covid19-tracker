import 'package:flutter/material.dart';

import '../map.dart';

class Venues extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('venues'),
          actions: <Widget>[
          IconButton(
            icon: Icon(
                Icons.settings,
                size:30,
                color: Colors.white,
      ),
      onPressed: () {
          
      },
    ),
  ],
        ),
        body: MyApp()
        /*Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Check into Venues',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    ))
               
               /* Container(
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
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Search Location to view nearby Venues'),
                      onPressed: () {
                        //autosuggestion for locations
                      },
                    )),
                    
                    Container(
                  height: 50,
                  
                    padding: EdgeInsets.only(top: 5),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Book Now'),
                      
                      onPressed: () {
                        //Venue Booking Page
                      },
                    )),*/
                  
                 
              ],
            ))*/);
  }
}
