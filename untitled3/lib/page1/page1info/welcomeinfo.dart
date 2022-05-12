//import 'package:cupertino_datepicker_example/utils.dart';
//import 'package:cupertino_datepicker_example/widget/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../bottomApp.dart';
import 'page1screen.dart';

class welcomescreeninfo extends StatefulWidget {
  @override
  _welcomescreeninfoState createState() => _welcomescreeninfoState();
}

class _welcomescreeninfoState extends State<welcomescreeninfo> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => BottomParPage(),
          ));
    });
  }

  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Color(0xfff2cbd0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.asset('assets/images/logoBaby.jpg',height: 250,),
            const SizedBox(
              height: 30,
            ),
            CupertinoActivityIndicator(
              radius: 25,
            )
          ],
        ),
      ));
}
