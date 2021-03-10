import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(countdown());
}

class countdown extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 14;
  Timer _timer;

  void _startTimer() {
    _counter = 14;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(days: 1, hours: 0, minutes: 0, seconds: 0),
        (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quarantine Tracker"),
        backgroundColor: const Color(0xff9e0091),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (_counter > 0)
                ? Text("")
                : Text(
                    "DONE!",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                    ),
                  ),
            Text(
              '$_counter',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
              ),
            ),
            RaisedButton(
              onPressed: () => _startTimer(),
              child: Text("Start 14 days Quarantine"),
              color: const Color(0xff9e0091),
            ),
          ],
        ),
      ),
    );
  }
}
