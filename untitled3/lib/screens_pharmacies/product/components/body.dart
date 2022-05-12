import 'package:flutter/material.dart';
import 'package:hotel_booking/api/pharm.dart';
import 'package:hotel_booking/components_pharmacies/search_box.dart';
import 'package:hotel_booking/constants_pharmacies.dart';
import 'package:hotel_booking/models_pharmacies/product.dart';
import 'package:hotel_booking/screens_pharmacies/details/details_screen.dart';

import '../../../api/clinicdata.dart';
import 'category_list.dart';
import 'product_card.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

String s = "";
setSerch(String s1) {
  s = s1;
}

getSerch() {
  return s;
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Pharm Service = Pharm();
    print(getSerch());

    return Container(
      child: FutureBuilder<List>(
        future: Service.getAllPharm(),
        builder: (context, snapshot) {
          var d = snapshot.data?.length;
          // print(snapshot.data![0]['name']
          //     .toLowerCase()
          //     .contains("".toLowerCase()));
          var c = 0;
          List<int> intArr = [];
          //int a = [d!] as int;
          if (snapshot.hasData) {
            print(snapshot.data);
            for (int i = 0; i < d!; i++) {
              if (snapshot.data![i]['name']
                  .toLowerCase()
                  .contains(getSerch().toLowerCase())) {
                print(snapshot.data![i]['country'].toLowerCase());
                /////////هون  مدينه اليوزر
                if (snapshot.data![i]['country']
                    .toLowerCase()
                    .contains("Palestine".toLowerCase())) {
                  c++;
                  intArr.add(i);
                }
              }
            }
            // print(intArr);
            // print(c);
            return SafeArea(
              bottom: false,
              child: Column(
                children: <Widget>[
                  SearchBox(onChanged: (value) {
                    //print(value);
                    setSerch(value);
                    setState(() {
                      // getFeature(s);
                      setSerch(value);
                    });
                    // print(getSerch());
                  }),
                  //CategoryList(),
                  SizedBox(height: kDefaultPadding / 4),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        // Our background
                        Container(
                          margin: EdgeInsets.only(top: 60),
                          decoration: BoxDecoration(
                            color: kBackgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                        ),
                        ListView.builder(
                          // here we use our demo procuts list
                          itemCount: c,
                          itemBuilder: (context, index) => ProductCard(
                            itemIndex: intArr[index],
                            name: snapshot.data![intArr[index]]['name'],
                            drname: snapshot.data![intArr[index]]['drname'],
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    index: intArr[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
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




// Container(
//       child: FutureBuilder<List>(
//         future: Service.getAllClinic(),
//         builder: (context, snapshot) {
//           var d = snapshot.data?.length;
//           // print(snapshot.data![0]['name']
//           //     .toLowerCase()
//           //     .contains("".toLowerCase()));
//           var c = 0;
//           List<int> intArr = [];
//           //int a = [d!] as int;
//           if (snapshot.hasData) {
//             for (int i = 0; i < d!; i++) {
//               if (snapshot.data![i]['name']
//                   .toLowerCase()
//                   .contains(getSerch().toLowerCase())) {
//                 c++;
//                 intArr.add(i);
//               }
//             }
//             // print(intArr);
//             // print(c);
//             return CarouselSlider(
//               options: CarouselOptions(
//                 height: 400,
//                 enlargeCenterPage: true,
//                 disableCenter: true,
//                 viewportFraction: .75,
//               ),
//               items: List.generate(
//                 c,
//                 (index) => FeatureItemClinic(
//                   data: snapshot.data![intArr[index]],
//                   onTapFavorite: () {
//                     bool t = true;
//                     print(de.addUser('name', 'pas', t, 'clinic'));
//                     // setState(() {
//                     //   features[index]["is_favorited"] =
//                     //       !features[index]["is_favorited"];
//                     // });
//                   },
//                   onTap: () {
//                     int index2 = intArr[index];
//                     Navigator.push(context, MaterialPageRoute(
//                       builder: (BuildContext context) {
//                         return DetailsScreen(
//                           index: index2,
//                         );
//                       },
//                     ));
//                   },
//                 ),
//               ),
//             );
//           } else {
//             return const Center(
//               child: Text('No Data Found'),
//             );
//           }
//         },
//       ),
//     );









//  SafeArea(
//         bottom: false,
//         child: Column(
//           children: <Widget>[
//             SearchBox(onChanged: (value) {
//               //print(value);
//               setSerch(value);
//               setState(() {
//                 // getFeature(s);
//                 setSerch(value);
//               });
//               // print(getSerch());
//             }),
//             //CategoryList(),
//             SizedBox(height: kDefaultPadding / 4),
//             Expanded(
//               child: Stack(
//                 children: <Widget>[
//                   // Our background
//                   Container(
//                     margin: EdgeInsets.only(top: 60),
//                     decoration: BoxDecoration(
//                       color: kBackgroundColor,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(40),
//                         topRight: Radius.circular(40),
//                       ),
//                     ),
//                   ),
//                   ListView.builder(
//                     // here we use our demo procuts list
//                     itemCount: products.length,
//                     itemBuilder: (context, index) => ProductCard(
//                       itemIndex: index,
//                       product: products[index],
//                       press: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DetailsScreen(
//                               index: index,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),