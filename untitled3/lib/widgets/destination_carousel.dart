import 'package:flutter/material.dart';
import 'package:hotel_booking/models/city_name_model.dart';
import 'package:hotel_booking/screens/destination_store_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../api/city.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    City Service = City();
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'All Destinations ',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 310.0,
          //  child: FutureBuilder<List>(
          // future: Service.getAllCity(),
          // builder: (context, snapshot) {
          //   int? d = snapshot.data?.length;
          //   print(snapshot.data?.length);
          //   if (snapshot.hasData) {
          //     print(snapshot.data![0]["openst"]);
          child: FutureBuilder<List>(
            future: Service.getAllCity(),
            builder: (context, snapshot) {
              int? d = snapshot.data?.length;
              print(snapshot.data?.length);
              if (snapshot.hasData) {
                print(snapshot.data![0]["name"]);
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: d,
                  itemBuilder: (BuildContext context, int index) {
                    destinations.add(Destination(
                        imageUrl: 'assets/images/venice.jpg',
                        city: snapshot.data![index]["name"],
                        country: "Palestine",
                        description: "palestinian city",
                        activities: activities));
                    Destination destination = destinations[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DestinationScreen(
                            destination: destination,
                          ),
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        width: 210.0,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Positioned(
                              bottom: 15.0,
                              child: Container(
                                height: 120.0,
                                width: 200.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        ' Stores',
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                      Text(
                                        destination.description,
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Hero(
                                    tag: index,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image(
                                        height: 180.0,
                                        width: 180.0,
                                        image: AssetImage(destination.imageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10.0,
                                    bottom: 10.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          destination.city,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              FontAwesomeIcons.locationArrow,
                                              size: 10.0,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 5.0),
                                            Text(
                                              destination.country,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('No Data Found'),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
