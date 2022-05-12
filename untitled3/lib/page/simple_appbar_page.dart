import 'package:hotel_booking/main.dart';
import 'package:hotel_booking/page/transparent_appbar_page.dart';
import 'package:flutter/material.dart';

import '../homeToyScreen.dart';
import '../screens/clinic.dart';
import '../screens/clothesHome.dart';
import '../screens/pharm.dart';
import '../screens_clinic/product/products_screen.dart';
import '../screens_pharmacies/product/products_screen.dart';

class SimpleAppBarPage extends StatefulWidget {
  @override
  _SimpleAppBarPageState createState() => _SimpleAppBarPageState();
}

class _SimpleAppBarPageState extends State<SimpleAppBarPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffffae88), Color(0xff8f93ea)],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
            bottom: TabBar(
              //isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Tab(icon: Icon(Icons.local_pharmacy), text: 'Pharmacis'),
                Tab(icon: Icon(Icons.local_hospital), text: 'Clinic'),
                Tab(icon: Icon(Icons.local_grocery_store), text: 'Stores'),
                Tab(icon: Icon(Icons.toys_outlined), text: 'Toys'),
              ],
            ),
            elevation: 20,
            titleSpacing: 20,
          ),
          body: TabBarView(
            children: [
              // TransparentAppBarPage(),
              PharmaciesScreen(),
              ProductsScreen(),
              ClothScreen(),
              HomeToyScreen(),
              // buildPage('Settings Page'),
            ],
          ),
        ),
      );

  Widget buildPage(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 28),
        ),
      );
}
