import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'user.dart';

class Users with ChangeNotifier {
  List<User> _userss = [];

  List<User> get users {
    return [..._userss];
  }

  Future<void> fetchAndSetUsers() async {
    const url = 'https://androidproj12-default-rtdb.firebaseio.com/users.json';
    try {
      final response = await http.get(url);
      final dbData = json.decode(response.body) as Map<String, dynamic>;
      final List<User> dbusers = [];
      dbData.forEach((key, data) {
        dbusers.add(User(
          username: data['username'],
          mail: data['mail'],
          age: data['age'],
          mobile: data['mobile'],
         
          pass: data['pass'],
        ));
      });
      _userss = dbusers;
      notifyListeners();
    } on Exception catch (e) {
      print(e.toString());
      throw (e);
    }
  }


  void addUser(User user)  {
    
    const url = 'https://androidproj12-default-rtdb.firebaseio.com/users.json';
    print('dfghjkl;');
    print(user.username);
     http.post(url,
            body: json.encode({
              'name': user.username,
              'mail': user.mail,
              'mobile': user.mobile,
              'age': user.age,
              
              'pass':user.pass,
            }))
        .then((http.Response response ) {
      final newUser = User(
          username: user.username,
          mail:user.mail,
          age: user.age,
          mobile: user.mobile,
         
          pass: user.pass,
          );
      _userss.add(newUser);
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }

}