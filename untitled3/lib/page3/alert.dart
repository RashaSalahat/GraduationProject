import 'package:flutter/material.dart';

import '../../page2/page2screen.dart';
import '../../widgets/curved_widget.dart';
import '../page1/page1info/welcomeinfo.dart';

class alertPa extends StatefulWidget {
  @override
  State<alertPa> createState() => _PalertState();
}

class _PalertState extends State<alertPa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        body: Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Stack(
              alignment: Alignment.topCenter,
              overflow: Overflow.visible,
              children: [
                Container(
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text("Baby Time",
                            style: TextStyle(
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                                color: Color(0xff6a515e))),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            "A new way to make parenting fun We have collected for you everything you need to raise your child." +
                                " You can communicate with doctors and book appointments\n" +
                                "you are not alone",
                            style: TextStyle(
                                // fontFamily: "Segoe UI",
                                fontSize: 18,
                                color: Color(0xff6a515e))),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          width: 90,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xffffae88), Color(0xff8f93ea)],
                            ),
                          ),
                          child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          welcomescreeninfo(),
                                    ));
                              },
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: StadiumBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const <Widget>[
                                    Text(
                                      "Start",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: -50,
                    child: CircleAvatar(
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(70)),
                          child: Image.asset("assets/images/log.jpg")),
                      radius: 45,
                    ))
              ]),
        ));
  }
}
