// import 'package:bottombar/page1.dart';
// import 'package:bottombar/page2.dart';
// import 'package:bottombar/page3.dart';
// import 'package:hotel_booking/page4.dart';
import 'package:hotel_booking/page/simple_appbar_page.dart';
import 'package:hotel_booking/profile/page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/settingpage/setpage.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'MainPageGrad/MainPageGrad.dart';

class BottomParPage extends StatefulWidget {
  const BottomParPage({Key? key}) : super(key: key);
  // final String title;
  @override
  State<BottomParPage> createState() => _BottomParPageState();
}

class _BottomParPageState extends State<BottomParPage> {
  // bg color
  Color bgColor = const Color(0XFF214283); //Colors.black;

  int _page = 0; //current page index

  //pages text
  final pages = [
    MyMainPageGrad(),
    SimpleAppBarPage(),
    ProfilePage(),
    ProfilePage(),
    // ProfilePage(),
    // NotificationsPage3(),
    // //NotificationsPage2(),
    // NotificationsPage3(),
    // NotificationsPage4(),
    SetScreen(),
    // NotificationsPage4(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPressedShowExitDialog(context),
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(""),
        //  backgroundColor: Colors.white,
        // ),
        backgroundColor: Colors.white,
        body: pages[_page],

        bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          height: 60.0,
          items: const <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.design_services,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.monetization_on_outlined,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.settings,
              size: 30,
              color: Colors.white,
            ),
          ],
          color: Color(0xffffae88),
          buttonBackgroundColor: Color(0xffffae88),
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),

        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  //define a toast method
  void toast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
    ));
  }

//close app confirm dialog
  Future<bool> _onBackButtonPressedShowExitDialog(BuildContext context) async {
    bool? exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          //create and return a dialog
          return AlertDialog(
            title: const Text("Really??"),
            content: const Text("Do you want to close the app ?"),
            actions: <Widget>[
              //a no btn
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("No, Stay"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Yes, Close"),
              ),
            ],
          );
        });
    return exitApp ?? false;
  }
}
