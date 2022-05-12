import 'package:flutter/material.dart';
import 'package:hotel_booking/api/toy.dart';
import 'package:hotel_booking/configuration.dart';

class Screen2 extends StatelessWidget {
  Screen2({Key? key, required this.ind}) : super(key: key);
  final int ind;
  @override
  Widget build(BuildContext context) {
    Toy Service = Toy();
    return Scaffold(
      body: FutureBuilder<List>(
        future: Service.getAllToys(),
        builder: (context, snapshot) {
          int? d = snapshot.data?.length;
          print(snapshot.data?.length);
          if (snapshot.hasData) {
            // print(snapshot.data![0]["openst"]);
            return Stack(
              children: [
                Positioned.fill(
                    child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Color(0xfff2cbd0),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                      ),
                    )
                  ],
                )),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                        tag: 1,
                        child: Image.asset('assets/images/product_0.png')),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.data![ind]['name'] + "\n",
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontFamily: 'Courier'),
                          ),
                          Text(snapshot.data![ind]['describtion'] + "\n",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54,
                                  fontFamily: 'Courier')),
                        ]),
                    height: 250,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: shadowList,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 120,
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Color(0xff6a515e),
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: Color(0xFFf5bde8),
                                borderRadius: BorderRadius.circular(20)),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff6a515e),
                                  shape: const StadiumBorder()),
                              child: const Text(
                                "Add to Favorite ",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: Text('No Data Found'),
            );
          }
        },
      ),
    );
  }
}
