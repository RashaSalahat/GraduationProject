import 'package:flutter/material.dart';
import 'package:hotel_booking/models/activity_model.dart';
import 'package:hotel_booking/models/city_name_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../api/store.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  DestinationScreen({required this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    Store Service = Store();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.black,
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: Icon(FontAwesomeIcons.sortAmountDown),
                          iconSize: 25.0,
                          color: Colors.black,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.destination.city,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.locationArrow,
                            size: 15.0,
                            color: Colors.white70,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            widget.destination.country,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 25.0,
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<List>(
              future: Service.getAllStore(),
              builder: (context, snapshot) {
                int? d = snapshot.data?.length;
                print(snapshot.data?.length);
                if (snapshot.hasData) {
                  print(snapshot.data![0]["name"]);
                  return ListView.builder(
                      padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                      itemCount: d,
                      itemBuilder: (BuildContext context, int index) {
                        //Activity activity = widget.destination.activities[index];
                        print(widget.destination.city == "Nablus");
                        if (widget.destination.city !=
                            snapshot.data![index]["city"]) return Container();
                        return Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                              height: 170.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    100.0, 20.0, 20.0, 20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 120.0,
                                          child: Text(
                                            snapshot.data![index]["name"],
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                        Column(
                                          children: <Widget>[
                                            // Text(
                                            //   '\$${activity.price}',
                                            //   style: TextStyle(
                                            //     fontSize: 22.0,
                                            //     fontWeight: FontWeight.w600,
                                            //   ),
                                            // ),
                                            // Text(
                                            //   'per pax',
                                            //   style: TextStyle(
                                            //     color: Colors.grey,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      snapshot.data![index]["describtion"],
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    _buildRatingStars(
                                        snapshot.data![index]["rating"]),
                                    SizedBox(height: 10.0),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(5.0),
                                          width: 80.0,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).accentColor,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            snapshot.data![index]["starttime"],
                                          ),
                                        ),
                                        SizedBox(width: 10.0),
                                        Container(
                                          padding: EdgeInsets.all(5.0),
                                          width: 80.0,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).accentColor,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            snapshot.data![index]["endtime"],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20.0,
                              top: 15.0,
                              bottom: 15.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  width: 110.0,
                                  image: AssetImage(
                                    "assets/images/hotel0.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                } else {
                  return const Center(
                    child: Text('No Data Found'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
