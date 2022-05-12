import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/theme/color.dart';
import 'package:hotel_booking/utils/data.dart';
import 'package:hotel_booking/widgets/featureItemClinic.dart';
import 'package:hotel_booking/widgets/featureItemClinic.dart';
import 'package:hotel_booking/screens/details_screen_pharmacy.dart';
import 'package:hotel_booking/api/clinicdata.dart';
import 'package:collection/collection.dart';
import 'package:hotel_booking/screens/details_screen.dart';

import '../api/userUpdate.dart';

class HomePageClinic extends StatefulWidget {
  const HomePageClinic({Key? key}) : super(key: key);

  @override
  State<HomePageClinic> createState() => _HomePageClinicState();
}

String s = "";

class _HomePageClinicState extends State<HomePageClinic> {
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
          //   title: getAppBar(),
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

  setSerch(String s1) {
    s = s1;
  }

  getSerch() {
    return s;
  }

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
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Text(
                "All Clinic",
                style: TextStyle(
                  color: inActiveColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ),
            getFeature(),
            SizedBox(height: 1.0),
          ],
        ),
      ),
    );
  }

  getFeature() {
    // print("sss" + s + "sss");
    print(getSerch());
    ClinicData Service = ClinicData();
    AddFav de = new AddFav();
    return Container(
      child: FutureBuilder<List>(
        future: Service.getAllClinic(),
        builder: (context, snapshot) {
          var d = snapshot.data?.length;
          // print(snapshot.data![0]['name']
          //     .toLowerCase()
          //     .contains("".toLowerCase()));
          var c = 0;
          List<int> intArr = [];
          //int a = [d!] as int;
          if (snapshot.hasData) {
            for (int i = 0; i < d!; i++) {
              if (snapshot.data![i]['name']
                  .toLowerCase()
                  .contains(getSerch().toLowerCase())) {
                c++;
                intArr.add(i);
              }
            }
            // print(intArr);
            // print(c);
            return CarouselSlider(
              options: CarouselOptions(
                height: 400,
                enlargeCenterPage: true,
                disableCenter: true,
                viewportFraction: .75,
              ),
              items: List.generate(
                c,
                (index) => FeatureItemClinic(
                  data: snapshot.data![intArr[index]],
                  onTapFavorite: () {
                    bool t = true;
                    print(de.addUser('name', 'pas', t, 'clinic'));
                    // setState(() {
                    //   features[index]["is_favorited"] =
                    //       !features[index]["is_favorited"];
                    // });
                  },
                  onTap: () {
                    int index2 = intArr[index];
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DetailsScreen(
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




// SizedBox(height: 16.0),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       padding: EdgeInsets.symmetric(
//                         vertical: 6.0,
//                         horizontal: 8.0,
//                       ),
//                       decoration: BoxDecoration(
//                         color: kPrimaryColor,
//                         borderRadius: BorderRadius.circular(14.0),
//                       ),
//                       child: TextField(
//                         cursorColor: kDarkColor,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           prefixIcon: Icon(
//                             Icons.search,
//                             color: Colors.grey,
//                             size: 34.0,
//                           ),
//                           hintText: "Search for Recipes",
//                           hintStyle: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 20.0,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),