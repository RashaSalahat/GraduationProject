//import 'package:aftersignup/color_filters.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/page/simple_appbar_page.dart';
import 'package:hotel_booking/theme/color.dart';
import 'package:hotel_booking/screens/clinic.dart';
import 'package:hotel_booking/screens/clothesHome.dart';
import 'package:hotel_booking/color_filters.dart';
import 'package:hotel_booking/screens/pharm.dart';
import 'package:hotel_booking/pages/root_app_fitness.dart';
import 'package:hotel_booking/themechat.dart';
import 'package:hotel_booking/screens/screens.dart';
import 'package:hotel_booking/bottomApp.dart';
import 'homeToyScreen.dart';
import 'loginpage/login/welcome.dart';
//import 'package:aftersignup/color.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String title = '';

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: AppTheme().light,
        darkTheme: AppTheme().light,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        title: title,
        //     debugShowCheckedModeBanner: false,
        // onGenerateRoute: router.generateRoute,
        // theme: ThemeData(primarySwatch: Colors.grey),
        // home: SimpleAppBarPage(),
        home: welcomescreen(),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        backgroundColor: pink,
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildClinicCard(),
            buildPharmCard(),
            buildClothesCard(),
            buildContactCard(),
            buildChatCard(),
            buildToysCard(),
          ],
        ),
      );

  Widget buildClinicCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              child: Ink.image(
                image: const NetworkImage(
                  'https://th.bing.com/th/id/R.b9cdd1dcade0c01a3496da31b579fa7e?rik=Bg053QqRo62O6w&pid=ImgRaw&r=0',
                ),
                colorFilter: ColorFilters.greyscale,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const ClinicApp(),
                        ));
                  },
                ),
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              'Clinics',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decorationColor: pink,
                //backgroundColor: pink,
                fontFamily: 'Langer',
                color: pink,
                fontSize: 28,
              ),
            ),
          ],
        ),
      );

  Widget buildPharmCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: const NetworkImage(
                'https://th.bing.com/th/id/R.8eec88362fa9e6589d4629d1a2ef93ca?rik=IxVvUnmH5irYCg&riu=http%3a%2f%2fwww.colorhexa.com%2fcd96cd.png&ehk=WQPxgHBGpL44GM4gJEe9T6PcO70q3wqAAW%2f2AtO5qyk%3d&risl=&pid=ImgRaw&r=0',
              ),
              //  colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const PharmApp(),
                      ));
                },
              ),
              height: 120,
              fit: BoxFit.cover,
            ),
            const Text(
              'Pharmacies',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: pink,
                fontSize: 28,
              ),
            ),
          ],
        ),
      );

  Widget buildContactCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: const NetworkImage(
                'https://th.bing.com/th/id/R.8eec88362fa9e6589d4629d1a2ef93ca?rik=IxVvUnmH5irYCg&riu=http%3a%2f%2fwww.colorhexa.com%2fcd96cd.png&ehk=WQPxgHBGpL44GM4gJEe9T6PcO70q3wqAAW%2f2AtO5qyk%3d&risl=&pid=ImgRaw&r=0',
              ),
              //  colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const RootAppFit(),
                      ));
                },
              ),
              height: 120,
              fit: BoxFit.cover,
            ),
            const Text(
              'Baby Health',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: pink,
                fontSize: 28,
              ),
            ),
          ],
        ),
      );

  Widget buildClothesCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: const NetworkImage(
                'https://th.bing.com/th/id/R.8eec88362fa9e6589d4629d1a2ef93ca?rik=IxVvUnmH5irYCg&riu=http%3a%2f%2fwww.colorhexa.com%2fcd96cd.png&ehk=WQPxgHBGpL44GM4gJEe9T6PcO70q3wqAAW%2f2AtO5qyk%3d&risl=&pid=ImgRaw&r=0',
              ),
              //  colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ClothScreen(),
                      ));
                },
              ),
              height: 120,
              fit: BoxFit.cover,
            ),
            const Text(
              'Clothes Store',
              style: TextStyle(
                fontFamily: 'Langer',
                fontWeight: FontWeight.bold,
                color: pink,
                fontSize: 28,
              ),
            ),
          ],
        ),
      );

  Widget buildChatCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: const NetworkImage(
                'https://th.bing.com/th/id/R.8eec88362fa9e6589d4629d1a2ef93ca?rik=IxVvUnmH5irYCg&riu=http%3a%2f%2fwww.colorhexa.com%2fcd96cd.png&ehk=WQPxgHBGpL44GM4gJEe9T6PcO70q3wqAAW%2f2AtO5qyk%3d&risl=&pid=ImgRaw&r=0',
              ),
              //  colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const HomeScreenChat(
                            title: 'Flutter Demo Home Page'),
                      ));
                },
              ),
              height: 120,
              fit: BoxFit.cover,
            ),
            const Text(
              'Contact with doctors',
              style: TextStyle(
                fontFamily: 'Langer',
                fontWeight: FontWeight.bold,
                color: pink,
                fontSize: 28,
              ),
            ),
          ],
        ),
      );

  Widget buildToysCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: const NetworkImage(
                'https://th.bing.com/th/id/R.8eec88362fa9e6589d4629d1a2ef93ca?rik=IxVvUnmH5irYCg&riu=http%3a%2f%2fwww.colorhexa.com%2fcd96cd.png&ehk=WQPxgHBGpL44GM4gJEe9T6PcO70q3wqAAW%2f2AtO5qyk%3d&risl=&pid=ImgRaw&r=0',
              ),
              //  colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomeToyScreen()));
                },
              ),
              height: 120,
              fit: BoxFit.cover,
            ),
            const Text(
              'Toys',
              style: TextStyle(
                fontFamily: 'Langer',
                fontWeight: FontWeight.bold,
                color: pink,
                fontSize: 28,
              ),
            ),
          ],
        ),
      );
}
