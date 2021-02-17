//Imports and Variable Declarations
import 'package:Client/Models/InformationPopUp.dart';
import 'package:Client/Models/User.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// User Controller Class Definition to conduct user management operations
class UserController {
  List<User> users = List<User>();
  String url = "https://gymbud.herokuapp.com/api/v1/users";

  // Checks Response from the backend server, to check if everything is OK
  Future<List<User>> getUsers() async {
    Response response = await get('$url');
    if (response.statusCode == 200) {
      var usersJSON = jsonDecode(response.body);
      for (var userJSON in usersJSON) {
        users.add(User.fromJSON(userJSON));
      }
      //usersJSON.map((user) => users.add(User.fromJSON(user)));
    }

    return users;
  }

  Future<User> createUser(User user) async {
    Response response =
        await http.post('https://gymbud.herokuapp.com/api/v1/users',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Accept': 'application/json',
              'credentials': 'include'
            },
            body: jsonEncode(user.toJson()));
    if (response.statusCode == 200) {
      var userJSON = jsonDecode(response.body);
      return User.fromJSON(userJSON);
    }
    return null;
  }

  Future<dynamic> loginUser(String username, String password) async {
    try {
      Response response =
          await http.post('http://10.0.2.2:7000/api/v1/users/login',
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                'Accept': 'application/json',
                'credentials': 'include'
              },
              body: jsonEncode({
                'username': username,
                'password': password,
              }));
      var userJSON = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (userJSON["user"] != null) return User.fromJSON(userJSON["user"]);
        if (userJSON["cause"] != null)
          return new InformationPopUp(message: userJSON["cause"][0]);
      }
    } catch (e) {
      print('caught error $e');
    }
    return null;
  }
}
