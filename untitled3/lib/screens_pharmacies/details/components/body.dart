import 'package:flutter/material.dart';
import 'package:hotel_booking/api/pharm.dart';
import 'package:hotel_booking/constants_pharmacies.dart';
import 'package:hotel_booking/models_pharmacies/product.dart';

import '../../../api/clinicdata.dart';
import 'chat_and_add_to_cart.dart';
import 'list_of_colors.dart';
import 'product_image.dart';

class Body extends StatelessWidget {
  final int index;

  const Body({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Pharm Service = Pharm();
    // it provide us total height and width
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    return Container(
      child: FutureBuilder<List>(
        future: Service.getAllPharm(),
        builder: (context, snapshot) {
          int? d = snapshot.data?.length;
          print(snapshot.data?.length);
          if (snapshot.hasData) {
            // print(snapshot.data![0]["openst"]);
            return SafeArea(
              bottom: false,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Hero(
                              tag: index,
                              child: ProductPoster(
                                size: size,
                                image: 'assets/images/hospital1.png',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: kDefaultPadding / 2),
                            child: Text(
                              snapshot.data![index]["name"],
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Text(
                            snapshot.data![index]["address"],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: kSecondaryColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              snapshot.data![index]["status"],
                              style: TextStyle(
                                  color: kTextLightColor, fontSize: 18),
                            ),
                          ),
                          // SizedBox(height: 10),
                          Center(
                            child: Text(
                              snapshot.data![index]["openst"] + "\n" + "\n",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ChatAndAddToCart(),
                  ],
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
