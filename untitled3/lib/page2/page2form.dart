import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/gradient_button.dart';

class page2Form extends StatefulWidget {

  @override
  State<page2Form> createState() => _page2FormState();
}

class _page2FormState extends State<page2Form> {
  DateTime dateTime = DateTime.now();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        child: Column(children: [
          Text("\nSelect your birthday\n",style: TextStyle(
            fontSize: 20,
            color: Color(0xff6a515e),
          ),),
          buildDatePicker(),






         ])
      ) );
  }
  Widget buildDatePicker() => SizedBox(
    height: 180,
    child: CupertinoDatePicker(
      minimumYear: 2000,
      maximumYear: DateTime.now().year,
      initialDateTime: dateTime,
      mode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (dateTime) =>
          setState(() => this.dateTime = dateTime),
    ),
  );
}
