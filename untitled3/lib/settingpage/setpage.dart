import 'package:hotel_booking/settingpage/consttants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Appointment/userappointment.dart';

class SetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(
                        top: size.height * .12,
                        left: size.width * .1,
                        right: size.width * .02),
                    height: size.height * .30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/bg.png"),
                        fit: BoxFit.fitWidth,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: BookInfo(
                      size: size,
                    )),
                Padding(
                  padding: EdgeInsets.only(top: size.height * .30 - 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        padding: EdgeInsets.all(10.0),
                        //color: Colors.pinkAccent,
                        width: 350,
                        height: 70,
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 0.0, 1.0, 0.0),
                                child: Text(
                                  'Report',
                                  style: GoogleFonts.pacifico(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 25,
                                      color: Color(0xff6a515e)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        padding: EdgeInsets.all(10.0),
                        //color: Colors.pinkAccent,
                        width: 350,
                        height: 70,
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 0.0, 1.0, 0.0),
                                child: Text('Food',
                                    style: GoogleFonts.pacifico(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 25,
                                        color: Color(0xff6a515e))),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        padding: EdgeInsets.all(10.0),
                        //color: Colors.pinkAccent,
                        width: 350,
                        height: 70,
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 0.0, 1.0, 0.0),
                                child: Text(
                                  'Charts',
                                  style: GoogleFonts.pacifico(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 25,
                                      color: Color(0xff6a515e)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        padding: EdgeInsets.all(10.0),
                        //color: Colors.pinkAccent,
                        width: 350,
                        height: 70,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                                return UserAppointment();
                              },
                            ));
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 0.0, 1.0, 0.0),
                                child: Text('Appointments',
                                    style: GoogleFonts.pacifico(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 25,
                                        color: Color(0xff6a515e))),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(100, 0.0, 0.0, 0.0),
                        child: Container(
                          width: 150,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xffffae88), Color(0xff8f93ea)],
                            ),
                          ),
                          child: MaterialButton(
                              onPressed: () {},
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: StadiumBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const <Widget>[
                                    Text(
                                      "Logout",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline5,
                      children: [],
                    ),
                  ),
                  SizedBox(height: 20),
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 180,
                        width: double.infinity,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 24, top: 24, right: 150),
                          height: 160,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29),
                            color: Color(0xFFFFF8F9),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(color: kBlackColor),
                                  children: [],
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  // BookRating(
                                  //   score: 4.9,
                                  // ),
                                  SizedBox(width: 10),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class ChapterCard extends StatelessWidget {
  final String name;
  final String tag;
  final int chapterNumber;
  final Function press;
  const ChapterCard({
    Key? key,
    required this.name,
    required this.tag,
    required this.chapterNumber,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      margin: EdgeInsets.only(bottom: 16),
      width: size.width - 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38.5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 33,
            color: Color(0xFFD3D3D3).withOpacity(.84),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Chapter $chapterNumber : $name \n",
                  style: TextStyle(
                    fontSize: 16,
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: tag,
                  style: TextStyle(color: kLightBlackColor),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}

class BookInfo extends StatelessWidget {
  const BookInfo({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.pink,
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Baby",
                        style: GoogleFonts.pacifico(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(0xff6a515e))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: this.size.height * .005),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 0),
                    child: Text("Time",
                        style: GoogleFonts.pacifico(
                            fontWeight: FontWeight.w200,
                            fontSize: 27,
                            color: Color(0xff6a515e))),
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin:
                                EdgeInsets.only(top: this.size.height * .015),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
