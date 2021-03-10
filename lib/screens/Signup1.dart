//import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
//import 'package:test2/homeCompany.dart';
import 'home.dart';
import '../models/user.dart';
import '../models/users.dart';


class Signup1 extends  StatelessWidget {
    static const routeName = '/edit-user';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Students signup',
      theme: new ThemeData(
          primarySwatch: Colors.blue, accentColor: Colors.redAccent),
      home: new SignUpForm(),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  SignUpFormState createState() => new SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  //var _passKey = GlobalKey<FormFieldState>();

  String username = '';
  String mail = '';
  String age = '';
  String pass = '';
  String major = '';
  String mobile='';
  var newuser= User(
    username: '',
    mail: '',
    age:  '',
    pass:'',
    
    mobile:'',
  );
  var _isLoading = false;
  final x=Users();
  void fn ()
  {
    x.addUser(newuser);
  }
  void saveForm()  {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    
    try {
         fn();
      } catch (error) {
         showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An error occurred!'),
            content: Text('Something went wrong.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
    
    setState(() {
      _isLoading = false;
    });
    //Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('user signup'),
        
      ),
      body: _isLoading ? CircularProgressIndicator():
      Form(
        key: _formKey,
        child:  ListView(
          children: <Widget>[
            TextFormField(
        decoration: InputDecoration(labelText: 'Enter Name', hintText: 'Name'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter a name';
          }
        },
        onSaved: (value) {
          
            newuser = User(
                            username: value,
                            mail:newuser.mail,
                            age:newuser.age,
                          
                            mobile:newuser.mobile,
                            pass:newuser.pass
                          );
          
        }),

        TextFormField(
        decoration:
            InputDecoration(labelText: 'Enter Email', hintText: 'Email'),
        keyboardType: TextInputType.emailAddress,
        validator:validateEmail,
        onSaved: (value) {
          
            newuser = User(
                            username: newuser.username,
                            mail:value,
                            age:newuser.age,
                            
                            mobile:newuser.mobile,
                            pass:newuser.pass
                          );
          
        }),

        TextFormField(
        decoration:
            InputDecoration(labelText: 'Enter mobile number', hintText: 'Phone '),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter  phone number';
          }
        
        },
        onSaved: (value) {
          newuser = User(
                            username: newuser.username,
                            mail:newuser.mail,
                            age:newuser.age,
                            
                            mobile:value,
                            pass:newuser.pass
                          );
        }),

        

        TextFormField(
        decoration: InputDecoration(labelText: 'Enter Age', hintText: 'Age'),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter Age';
          }
        },
        onSaved: (value) {
          newuser = User(
                            username: newuser.username,
                            mail:newuser.mail,
                            age:value,

                            mobile:newuser.mobile,
                            pass:newuser.pass
                          );
        }
      ),

      TextFormField(
        //  key: _passKey,
        obscureText: true,
        decoration:
            InputDecoration(labelText: 'Enter Password', hintText: 'Password'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter Password';
          }
          if (value.length < 8) {
            return 'Password should be more than 8 characters';
          }
        }),

        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'Confirm Password',
              labelText: 'Enter Confirm Password'),
          validator: (confirmPassword) {
            if (confirmPassword.isEmpty) return 'Enter confirm password';
            //var password = _passKey.currentState.value;
            
          },
          onSaved: (value) {
            newuser = User(
                            username: newuser.username,
                            mail:newuser.mail,
                            age:newuser.age,
                            
                            mobile:newuser.mobile,
                            pass:value
                          );
          }),
          RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('Sign Up'),
          onPressed: ()  {
            if (_formKey.currentState.validate())
            {  
              
                saveForm();
                _formKey.currentState.save();
                Navigator.push(context,MaterialPageRoute(builder: (context) => home()));
              }
        }),


          ],
        ),
      ),
    );
  }

  
  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter mail';
    }

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

 
}