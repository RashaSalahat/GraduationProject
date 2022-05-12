import 'package:country_picker/country_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotel_booking/loginpage/login/login_form.dart';
import '../page2/page2screen.dart';

var userReg = getUsername();

class AuthService {
  Dio dio = new Dio();
  login(name, password) async {
    try {
      return await dio.post('http://10.0.2.2:3000/authenticate',
          data: {"name": name, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response?.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  addUser(name, password) async {
    return await dio.post('http://10.0.2.2:3000/adduser',
        data: {"name": name, "password": password},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addWorkout(name, Mon, Tue, Wed, Thur, Fri, Sat, Sun) async {
    return await dio.post('http://10.0.2.2:3000/addWorkout',
        data: {
          "name": name,
          "Mon": Mon,
          "Tue": Tue,
          "Wed": Wed,
          "Thur": Thur,
          "Fri": Fri,
          "Sat": Sat,
          "Sun": Sun
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addSleep(name, Mon, Tue, Wed, Thur, Fri, Sat, Sun) async {
    return await dio.post('http://10.0.2.2:3000/addSleep',
        data: {
          "name": name,
          "Mon": Mon,
          "Tue": Tue,
          "Wed": Wed,
          "Thur": Thur,
          "Fri": Fri,
          "Sat": Sat,
          "Sun": Sun
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addMilk(name, Mon, Tue, Wed, Thur, Fri, Sat, Sun) async {
    return await dio.post('http://10.0.2.2:3000/addMilk',
        data: {
          "name": name,
          "Mon": Mon,
          "Tue": Tue,
          "Wed": Wed,
          "Thur": Thur,
          "Fri": Fri,
          "Sat": Sat,
          "Sun": Sun
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addMass(name, Height, Mass) async {
    return await dio.post('http://10.0.2.2:3000/addMass',
        data: {"name": name, "Height": Height, "Mass": Mass},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  getinfo(token) async {
    dio.options.headers['Authorizations'] = 'Bearer $token';
    return await dio.get('http://10.0.2.2:3000/getinfo');
  }

  update(about, email, image) async {
    return await dio.post('http://10.0.2.2:3000/updateOne/Rasha',
        data: {"about": about, "email": email, "userImage": image},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  updateUser(Country) async {
    return await dio.post('http://10.0.2.2:3000/update/Rasha',
        data: {"country": Country},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  updatewithoutimage(about, email) async {
    return await dio.post('http://10.0.2.2:3000/updatee/Rasha',
        data: {"about": about, "email": email},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addNewAppointment(appointmentid, username, Doctorname, date) async {
    return await dio.post('http://10.0.2.2:3000/addapp',
        data: {
          "appointmentid": appointmentid,
          "username": username,
          "Doctorname": Doctorname,
          "date": date
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  getAllApp() async {
    return await dio.post('http://10.0.2.2:3000/app/Rasha',
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }
}
