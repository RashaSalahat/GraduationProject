import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:hotel_booking/theme/color.dart';
import 'package:hotel_booking/constants.dart';
import 'package:hotel_booking/utils/Product.dart';
import 'package:hotel_booking/utils/data.dart';
import 'package:hotel_booking/color_dot.dart';

import '../api/clinicdata.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    ClinicData Service = ClinicData();
    return Scaffold(
      backgroundColor: pink,
      appBar: AppBar(
        backgroundColor: pink,
        leading: const BackButton(color: Colors.black),
      ),
      body: Container(
        child: FutureBuilder<List>(
          future: Service.getAllClinic(),
          builder: (context, snapshot) {
            int? d = snapshot.data?.length;
            print(snapshot.data?.length);
            if (snapshot.hasData) {
              // print(snapshot.data![0]["openst"]);
              return Column(
                children: [
                  Image.asset(
                    "assets/images/ra.png",
                    height: MediaQuery.of(context).size.height * 0.4,
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(height: defaultPadding * 1.5),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(defaultPadding,
                          defaultPadding * 2, defaultPadding, defaultPadding),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(defaultBorderRadius * 3),
                          topRight: Radius.circular(defaultBorderRadius * 3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  snapshot.data![index]
                                      ['name'], //اسم االدكتور او العيادة
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              const SizedBox(width: defaultPadding),
                              Text(
                                snapshot.data![index]['doctor'],
                                style: TextStyle(
                                    fontSize: 18,
                                    color: red,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: defaultPadding),
                            child: Text('', //ساعات العمل
                                style: TextStyle(
                                    color: red, fontWeight: FontWeight.w900)),
                          ),
                          Text(snapshot.data![index]['information'],
                              style: TextStyle(
                                  fontSize: 18,
                                  color: labelColor,
                                  fontWeight: FontWeight.bold)),
                          Text(snapshot.data![index]['status'],
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                              )),
                          const SizedBox(height: defaultPadding * 0.5),
                          Center(
                            child: SizedBox(
                              width: 200,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () {
                                  //بضيفها للدكاترة الي ممكن احكي معهم او اروح على عيادتهم
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: pink,
                                    shape: const StadiumBorder()),
                                child: const Text("Add to Contact"),
                              ),
                            ),
                          )

                          // const SizedBox(height: defaultPadding * 4),
                        ],
                      ),
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
      ),
    );
  }
}
