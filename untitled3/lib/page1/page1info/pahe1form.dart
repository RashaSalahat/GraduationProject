import 'package:flutter/material.dart';

import 'package:country_list_pick/country_list_pick.dart';
import '../../page2/page2screen.dart';

String s = '';
setUsercountry(String s1) {
  s = s1;
}

getUsercountry() {
  return s;
}

String? pickedCountryCode;

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    new MaterialApp();
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Form(
        child: Column(
          children: [
            SizedBox(
              height: 2,
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.female_rounded,
                    color: Color(0xff6a515e),
                  ),
                  labelText: 'Your Name'),
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            SizedBox(
              height: 40,
            ),
            Row(children: [
              Icon(
                Icons.home_outlined,
                color: Color(0xff6a515e),
              ),
              SizedBox(
                width: 2,
              ),

              CountryListPick(
                appBar: AppBar(
                  backgroundColor: Colors.amber,
                  title: Text('Pick your country'),
                ),
                theme: CountryTheme(
                  isShowFlag: true,
                  isShowTitle: true,
                  isShowCode: true,
                  isDownIcon: true,
                  showEnglishName: false,
                  labelColor: Colors.blueAccent,
                ),
                initialSelection: '+62',
                onChanged: (CountryCode? code) {
                  print(code?.name);
                  print(code?.code);
                  print(code?.dialCode);
                  print(code?.flagUri);
                  setUsercountry(code!.name.toString());
                },
              ) //  print();
              //  setUsercountry(pickedCountryCode.toString())
            ]),

            SizedBox(
              height: 40,
            ),
            // SizedBox(
            //   height: 10,
            // ),
/*

       TextFormField(
         controller: _nameController,
         decoration: InputDecoration(
             icon: Icon(Icons.location_city,color:Color(0xff6a515e),),
             labelText: 'Your City'
         ),
         keyboardType: TextInputType.emailAddress,
         autovalidateMode:AutovalidateMode.onUserInteraction,
       ),
*/
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
