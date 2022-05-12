import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking/loginpage/login/login_form.dart';
import 'package:hotel_booking/services/authservice.dart';

import 'MainPageGrad.dart';
import '../main.dart';

class Mass extends StatefulWidget {
  const Mass({Key? key}) : super(key: key);

  @override
  State<Mass> createState() => _MassState();
}

final items = ['1 hour', '2 hours', '3 hours', '4 hours', '5 hours'];
var Hieght, Weight;
var username = getUsername();
String valuue = items[0].toString();

class _MassState extends State<Mass> {
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
final height = TextEditingController();
final age = TextEditingController();

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
                  "Mass information",
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
                      title: Text('Height'),
                      content: Column(
                        children: [
                          TextFormField(
                            controller: height,
                            decoration: InputDecoration(
                              labelText: 'cm',
                            ),
                            onChanged: (val) {
                              Hieght = val;
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
                      title: Text('Weight'),
                      content: Column(
                        children: [
                          TextFormField(
                            controller: weight,
                            cursorWidth: 30,
                            decoration: InputDecoration(
                              labelText: "Kgm",
                            ),
                            onChanged: (val) {
                              Weight = val;
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                  currentStep: currentStep,
                  onStepContinue: () {
                    final isLastStep = (currentStep == 2 - 1);
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
                          if (2 - 1 != currentStep)
                            Expanded(
                              child: ElevatedButton(
                                onPressed: controls.onStepContinue,
                                child: const Text('Next'),
                              ),
                            ),
                          if (currentStep == 2 - 1)
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  AuthService()
                                      .addMass(username, Hieght, Weight)
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
