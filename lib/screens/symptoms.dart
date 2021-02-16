import 'package:flutter/material.dart';


class symptoms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Check symptomps ';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}


class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Name'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter Name';
              }
              return null;
            },
          ),
          TextFormField(
              decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Body Tempreture'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter Body Tempreture';
              }
              return null;
            },
          ),
          
          TextFormField(
              decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Been in contact with any covid-19 carrier'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your answer';
              }
              return null;
            },
          ),

          TextFormField(
              decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Do you have fever or chills?'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your answer';
              }
              return null;
            },
          ),
          TextFormField(
              decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Do you have cough or shortens of birth?'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your answer';
              }
              return null;
            },
          ),
          TextFormField(
              decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Do you have body aches or headaches'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your answer';
              }
              return null;
            },
          ),
          

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                
                if (_formKey.currentState.validate()) {
                  
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}


