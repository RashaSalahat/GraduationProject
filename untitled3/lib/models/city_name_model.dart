import 'package:hotel_booking/models/activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
    required this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/stmarksbasilica.jpg',
    name: 'Fox',
    type: 'For all ages',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    // price: 30,
  ),
  Activity(
    imageUrl: 'assets/images/gondola.jpg',
    name: 'Areena Kids',
    type: 'For new born babies',
    startTimes: ['9:00 pm', '6:00 pm'],
    rating: 4,
    // price: 210,
  ),
  Activity(
    imageUrl: 'assets/images/murano.jpg',
    name: 'Babylone',
    type: 'For all ages',
    startTimes: ['12:30 am', '10:00 pm'],
    rating: 3,
    // price: 125,
  ),
];

List<Destination> destinations = [
  // Destination(
  //   imageUrl: 'assets/images/venice.jpg',
  //   city: 'Nablus',
  //   country: 'Palestine',
  //   description: 'Visit Venice for an amazing and unforgettable adventure.',
  //   activities: activities,
  // ),
  // Destination(
  //   imageUrl: 'assets/images/paris.jpg',
  //   city: 'Hebron',
  //   country: 'Palestine',
  //   description: 'Visit Paris for an amazing and unforgettable adventure.',
  //   activities: activities,
  // ),
  // Destination(
  //   imageUrl: 'assets/images/newdelhi.jpg',
  //   city: 'Tulkarm',
  //   country: 'Palestine',
  //   description: 'Visit New Delhi for an amazing and unforgettable adventure.',
  //   activities: activities,
  // ),
  // Destination(
  //   imageUrl: 'assets/images/saopaulo.jpg',
  //   city: 'Amman',
  //   country: 'Jordan',
  //   description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
  //   activities: activities,
  // ),
  // Destination(
  //   imageUrl: 'assets/images/newyork.jpg',
  //   city: 'Jerusalem',
  //   country: 'Palestine',
  //   description: 'Visit New York for an amazing and unforgettable adventure.',
  //   activities: activities,
  // ),
];
