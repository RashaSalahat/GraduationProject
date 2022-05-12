import 'dart:convert';

import 'package:http/http.dart' as http;

class Userr {
  String baseUrl = "http://localhost:3000/showprofiles";
  //+ getUsername();
  Future<List> getAllUsers() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
