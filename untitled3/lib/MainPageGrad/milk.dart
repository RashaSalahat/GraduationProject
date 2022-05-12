import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking/MainPageGrad/mass.dart';

import '../loginpage/login/login_form.dart';
import '../services/authservice.dart';
import 'MainPageGrad.dart';
import '../main.dart';

class Milk extends StatefulWidget {
  const Milk({Key? key}) : super(key: key);

  @override
  State<Milk> createState() => _MilkState();
}

final items = ['1 hour', '2 hours', '3 hours', '4 hours', '5 hours'];
var sun, mon, tue, wed, thu, fri, sat;
var username = getUsername();
String valuue = items[0].toString();

class _MilkState extends State<Milk> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          //primarySwatch: Colors.blue,
          ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int currentStep = 0;

final weight = TextEditingController();
final sleep = TextEditingController();
final age = TextEditingController();
final monday = TextEditingController();
final tuesday = TextEditingController();
final wednesday = TextEditingController();
final thursday = TextEditingController();
final friday = TextEditingController();
final saturday = TextEditingController();
final sunday = TextEditingController();

final postcode = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Overide the default Back button
          automaticallyImplyLeading: true,
          leadingWidth: 100,
          backgroundColor: Colors.white,
          leading: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return MyMainPageGrad();
                },
              ));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            label: const Text(''),
            style: ElevatedButton.styleFrom(
                elevation: 0, primary: Colors.transparent),
          ),
        ),
        body: SingleChildScrollView(
            child: Stack(children: <Widget>[
          SafeArea(
            child: Theme(
              data: ThemeData(
                  canvasColor: Color(0xfff2cbd0),
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                        primary: Color(0xff6a515e),
                        background: Color(0xff6a515e),
                        secondary: Color(0xfff2cbd0),
                      )),
              child: Column(children: [
                Text(
                  "Milk",
                  style: GoogleFonts.pacifico(
                      fontWeight: FontWeight.w200,
                      fontSize: 30,
                      color: Color(0xff6a515e)),
                ),
                Stepper(
                  type: StepperType.vertical,
                  steps: [
                    Step(
                      state: currentStep > 0
                          ? StepState.complete
                          : StepState.indexed,
                      isActive: currentStep >= 0,
                      title: Text('Monday'),
                      content: Column(
                        children: [
                          TextFormField(
                            controller: monday,
                            decoration: InputDecoration(
                              labelText: 'times',
                            ),
                            onChanged: (val) {
                              mon = val;
                            },
                          )
                        ],
                      ),
                    ),
                    Step(
                      state: currentStep > 1
                          ? StepState.complete
                          : StepState.indexed,
                      isActive: currentStep >= 1,
                      title: Text('Tuesday'),
                      content: Column(
                        children: [
                          TextFormField(
                            controller: tuesday,
                            cursorWidth: 30,
                            decoration: InputDecoration(
                              labelText: "times",
                            ),
                            onChanged: (val) {
                              tue = val;
                            },
                          )
                        ],
                      ),
                    ),
                    Step(
                      state: currentStep > 2
                          ? StepState.complete
                          : StepState.indexed,
                      isActive: currentStep >= 2,
                      title: Text('Wednesday'),
                      content: Column(
                        children: [
                          TextFormField(
                            controller: wednesday,
                            cursorWidth: 30,
                            decoration: InputDecoration(
                              labelText: "times",
                            ),
                            onChanged: (val) {
                              wed = val;
                            },
                          )
                        ],
                      ),
                    ),
                    Step(
                      state: currentStep > 3
                          ? StepState.complete
                          : StepState.indexed,
                      isActive: currentStep >= 3,
                      title: Text('Thursday'),
                      content: Column(
                        children: [
                          TextFormField(
                            controller: thursday,
                            cursorWidth: 30,
                            decoration: InputDecoration(
                              labelText: "times",
                            ),
                            onChanged: (val) {
                              thu = val;
                            },
                          )
                        ],
                      ),
                    ),
                    Step(
                      state: currentStep > 4
                          ? StepState.complete
                          : StepState.indexed,
                      isActive: currentStep >= 4,
                      title: Text('Friday'),
                      content: Column(
                        children: [
                          TextFormField(
                            controller: friday,
                            cursorWidth: 30,
                            decoration: InputDecoration(
                              labelText: "times",
                            ),
                            onChanged: (val) {
                              fri = val;
                            },
                          )
                        ],
                      ),
                    ),
                    Step(
                      state: currentStep > 5
                          ? StepState.complete
                          : StepState.indexed,
                      isActive: currentStep >= 5,
                      title: Text('Saturday'),
                      content: Column(
                        children: [
                          TextFormField(
                            controller: saturday,
                            cursorWidth: 30,
                            decoration: InputDecoration(
                              labelText: "times",
                            ),
                            onChanged: (val) {
                              sat = val;
                            },
                          )
                        ],
                      ),
                    ),
                    Step(
                      state: currentStep > 6
                          ? StepState.complete
                          : StepState.indexed,
                      isActive: currentStep >= 6,
                      title: Text('sunday'),
                      content: Column(
                        children: [
                          TextFormField(
                            controller: wednesday,
                            cursorWidth: 30,
                            decoration: InputDecoration(
                              labelText: "times",
                            ),
                            onChanged: (val) {
                              sun = val;
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                  currentStep: currentStep,
                  onStepContinue: () {
                    final isLastStep = (currentStep == 7 - 1);
                    if (isLastStep) {
                      print('Completed');
                    } else {
                      setState(() {
                        currentStep++;
                      });
                    }
                  },
                  onStepTapped: (step) => setState(() {
                    currentStep = step;
                  }),
                  onStepCancel: () {
                    if (currentStep == 0) {
                    } else {
                      setState(() {
                        currentStep--;
                      });
                    }
                  },
                  controlsBuilder:
                      (BuildContext context, ControlsDetails controls) {
                    return Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Row(
                        children: <Widget>[
                          if (7 - 1 != currentStep)
                            Expanded(
                              child: ElevatedButton(
                                onPressed: controls.onStepContinue,
                                child: const Text('Next'),
                              ),
                            ),
                          if (currentStep == 7 - 1)
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  AuthService()
                                      .addMilk(username, mon, tue, wed, thu,
                                          fri, sat, sun)
                                      .then((val) {
                                    Fluttertoast.showToast(
                                        msg: val.data['msg'],
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  });
                                },
                                child: const Text('Finish'),
                              ),
                            ),
                          const SizedBox(
                            width: 12,
                          ),
                          if (currentStep != 0)
                            Expanded(
                              child: TextButton(
                                onPressed: controls.onStepCancel,
                                child: const Text('Back'),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ]),
            ),
          )
        ])));
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ));
