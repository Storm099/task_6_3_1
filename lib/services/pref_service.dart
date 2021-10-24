
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_6_3_1/models/user_model.dart';

class Prefs{
  static storeUser(User user) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user);
    return prefs.setString("user", stringUser);
  }

  static Future<User?> loadUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ?stringUser = prefs.getString("user");
    if(stringUser == null || stringUser.isEmpty) return null;
    Map<String, dynamic> map = jsonDecode(stringUser);
    return User.fromJson(map);
  }

  static Future<bool> removeUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("user");
  }


}