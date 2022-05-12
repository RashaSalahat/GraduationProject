import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/gradient_button.dart';

class page3form extends StatefulWidget {

  @override
  State<page3form> createState() => _page3formFormState();
}

class _page3formFormState extends State<page3form> {
  DateTime dateTime = DateTime.now();
  String _selectedGender = 'Yes';
  String _selectedExperiance='Yes';
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _numberController=TextEditingController();
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

              //buildDatePicker(),

                Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Are you pregnant?',style:TextStyle(fontSize: 18,
                            color: Color(0xff6a515e))),
                        ListTile(
                          leading: Radio<String>(
                            value: 'Yes',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value!;
                              });
                            },
                          ),
                          title: const Text('Yes',style:TextStyle(fontSize: 14,
                              color: Color(0xff6a515e))),
                        ),
                        ListTile(
                          leading: Radio<String>(
                            value: 'No',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value!;
                              });
                            },
                          ),
                          title: const Text('No',style:TextStyle(fontSize: 14,
                              color: Color(0xff6a515e))),
                        ),
                        const SizedBox(height: 15),
                        // Text(_selectedGender == 'Yes' ? 'Hello gentlement!' : 'Hi lady!')
                      ],
                    )),
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('if you are pregnant is this the first experience?',style:TextStyle(fontSize: 18,
                      color: Color(0xff6a515e))),
                      ListTile(
                        leading: Radio<String>(
                          value: 'Yes',
                          groupValue: _selectedExperiance,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                        title: const Text('Yes',style:TextStyle(fontSize: 14,
                            color: Color(0xff6a515e))),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          value: 'No',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                        title: const Text('No',style:TextStyle(fontSize: 14,
                            color: Color(0xff6a515e))),
                      ),
                      // const SizedBox(height: 25),
                      // Text(_selectedGender == 'Yes' ? 'Hello gentlement!' : 'Hi lady!')
                    ],
                  )),TextFormField(
      controller: _numberController,
      decoration: InputDecoration(
          icon: Icon(Icons.child_care,color:Color(0xff6a515e),),
          labelText: 'Number of Children'
      ),
      keyboardType: TextInputType.emailAddress,
      autovalidateMode:AutovalidateMode.onUserInteraction,
    ),const SizedBox(height: 25),





            ])
        ) );
  }

}
