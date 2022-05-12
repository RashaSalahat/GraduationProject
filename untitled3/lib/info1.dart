import 'package:flutter/material.dart';
import 'package:hotel_booking/page1/page1info/page1screen.dart';
import 'package:hotel_booking/page1/page1info/page1screen.dart';
import 'package:hotel_booking/page1/page1info/welcomeinfo.dart';

class information extends StatelessWidget {
  const information({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff6a515e),
        cursorColor: Color(0xff6a515e),
      ),
      home: LoginScreen(),
    );
  }
}
