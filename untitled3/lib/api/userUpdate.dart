import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddFav {
  Dio dio = new Dio();
  addUser(username, FavClinic, Fav, stype) async {
    try {
      return await dio.post('http://10.0.2.2:8001/api/user',
          data: {
            "username": username,
            "FavClinic": FavClinic,
            "Fav": Fav,
            "type": stype
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      print(e);
      // Fluttertoast.showToast(
      //     msg: e.response?.data['msg'],
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }
}
