import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hotel_booking/api/pharm.dart';
import 'package:hotel_booking/theme/color.dart';
import 'package:hotel_booking/utils/data.dart';
import 'package:hotel_booking/widgets/feature_item.dart';
import 'package:hotel_booking/screens/details_screen_pharmacy.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

String s = "";

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pink,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   backgroundColor: pink,
          //   pinned: true,
          //   snap: true,
          //   floating: true,
          //   // title: getAppBar(),
          // ),
          SliverToBoxAdapter(
            child: buildBody(),
          ),
        ],
      ),
    );
  }

  // Widget getAppBar() {
  //   return Container(
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Column(
  //           children: [
  //             Row(
  //               children: [
  //                 Icon(
  //                   Icons.place_outlined,
  //                   color: labelColor,
  //                   size: 20,
  //                 ),
  //                 SizedBox(
  //                   width: 3,
  //                 ),
  //                 Text(
  //                   "Nablus",
  //                   style: TextStyle(
  //                     color: darker,
  //                     fontSize: 13,
  //                   ),
  //                 ),
  //               ],
  //             )
  //           ],
  //         ),
  //         Spacer(),
  //       ],
  //     ),
  //   );
  // }

  buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (value) {
                  //print(value);
                  setSerch(value);
                  setState(() {
                    // getFeature(s);
                    setSerch(value);
                  });
                  // print(getSerch());
                },
                cursorColor: Colors.black26,
                decoration: InputDecoration(
                  // border: OutlineInputBorder(),
                  hintText: 'search',
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 34.0,
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            //   // child: Text(
            //   //   "Pharmacies",
            //   //   style: TextStyle(
            //   //     fontFamily: 'Railway',
            //   //     color: textColor,
            //   //     fontWeight: FontWeight.w600,
            //   //     fontSize: 33,
            //   //   ),
            //   // ),
            // ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Text(
                "All Pharmacies",
                style: TextStyle(
                  color: inActiveColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ),
            getFeature(),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  setSerch(String s1) {
    s = s1;
  }

  getSerch() {
    return s;
  }

  getFeature() {
    print(getSerch());
    print(features.length);
    Pharm Service = Pharm();
    //  return  Container(
    //       child: FutureBuilder<List>(
    //       future: Service.getAllPharm(),
    //          builder: (context, snapshot)  {
    //             print(snapshot.data);

    //          if (snapshot.hasData) {
    //             return ListView.builder(
    //                itemCount: snapshot.data?.length,
    //                itemBuilder: (context, i) {
    return Container(
      child: FutureBuilder<List>(
        future: Service.getAllPharm(),
        builder: (context, snapshot) {
          int? d = snapshot.data?.length;
          print(snapshot.data?.length);

          var c = 0;
          List<int> intArr = [];
          if (snapshot.hasData) {
            for (int i = 0; i < d!; i++) {
              if (snapshot.data![i]['name']
                  .toLowerCase()
                  .contains(getSerch().toLowerCase())) {
                c++;
                intArr.add(i);
              }
            }
            return CarouselSlider(
              options: CarouselOptions(
                height: 400,
                enlargeCenterPage: true,
                disableCenter: true,
                viewportFraction: .75,
              ),
              items: List.generate(
                c,
                (index) => FeatureItem(
                  data: snapshot.data![intArr[index]],
                  onTapFavorite: () {
                    // setState(() {
                    //   features[index]["is_favorited"] =
                    //       !features[index]["is_favorited"];
                    // });
                  },
                  onTap: () {
                    int index2 = index;
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DetailsPharmacyScreen(
                          index: index2,
                        );
                      },
                    ));
                  },
                ),
              ),
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
