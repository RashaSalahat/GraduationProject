import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:hotel_booking/MainPageGrad/mass.dart';
import 'package:hotel_booking/MainPageGrad/milk.dart';
import 'package:hotel_booking/MainPageGrad/sleep.dart';
import 'package:hotel_booking/MainPageGrad/workout.dart';
import 'package:hotel_booking/chart/pages/home_page.dart';

class MyMainPageGrad extends StatelessWidget {
  static final String title = 'Interests';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPageProject(),
      );
}

class MainPageProject extends StatefulWidget {
  @override
  _MainPageProjectState createState() => _MainPageProjectState();
}

class _MainPageProjectState extends State<MainPageProject> {
  Widget button(
      {required VoidCallback onPressed,
      double? buttonWidth,
      String? buttonText}) {
    return Container(
      width: buttonWidth,
      padding: const EdgeInsets.all(5.0),
      height: 80,
      child: RaisedButton(
        color: Color(0xfff2cbd0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        onPressed: onPressed,
        child: Text(buttonText!),
      ),
    );
  }

  final pageController = PageController(viewportFraction: 0.7);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width *
        0.5; //getting half of the current width for each button

    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: SizedBox(
              height: 200.0,
              width: double.infinity,
              child: Carousel(
                dotSize: 1.0,
                dotSpacing: 15.0,
                dotPosition: DotPosition.bottomCenter,
                images: [
                  Image.asset('assets/images/1.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/2.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/3.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/4.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/5.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/6.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            flex: 1),
        Divider(
          height: 10,
        ),
        Expanded(
            child: Container(
          child: Row(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 160,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        children: [
                          //two rows, each one with 2 buttons

                          Row(
                            children: [
                              button(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return Workout();
                                    },
                                  ));
                                },
                                buttonWidth: buttonWidth,
                                buttonText: 'Add Workout',
                              ),
                              button(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return Sleep();
                                    },
                                  ));
                                },
                                buttonWidth: buttonWidth,
                                buttonText: 'Add Sleep',
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              button(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return Milk();
                                    },
                                  ));
                                },
                                buttonWidth: buttonWidth,
                                buttonText: 'Add Milk',
                              ),
                              button(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return Mass();
                                    },
                                  ));
                                },
                                buttonWidth: buttonWidth,
                                buttonText: 'Add Mass',
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        //a container to give a white space around the inner widget
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Align(
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: RaisedButton(
                              child: Text(
                                'The Week\nreport',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              color: Color(0xff6a515e), //the main button
                              shape: CircleBorder(),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return Chartpage();
                                  },
                                ));
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        )),
        // Text(
        //   '${pageIndex + 1}/${locations.length}',
        //   style: TextStyle(color: Colors.white70),
        // ),
        SizedBox(height: 12),
      ],
    ));
  }
}
