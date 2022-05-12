import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../page1/page1info/welcomeinfo.dart';
import '../../profile/page/profile_page.dart';
import '../../register/register_screen.dart';
import '../../widgets/gradient_button.dart';
import 'login_screen.dart';
import '../../services/authservice.dart';

int flag = 1;
String s = '';
setUsername(String s1) {
  s = s1;
}

getUsername() {
  return s;
}

String p = '';
setUserpassword(String p1) {
  p = p1;
}

getUserpassword() {
  return p;
}

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var name, password, token;
  var username;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                labelText: 'Name', //
              ),
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (val) {
                name = val;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock), labelText: 'Password'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: true,
              onChanged: (val) {
                password = val;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xffffae88), Color(0xff8f93ea)])),
            ),
            Container(
              width: 150,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xffffae88), Color(0xff8f93ea)],
                ),
              ),
              child: MaterialButton(
                  onPressed: () {
                    AuthService().login(name, password).then((val) {
                      if (val.data['success']) {
                        //_navigateToNextScreen(context);
                        username = name;
                        setUsername(name);
                        print("username is :" + username);
                        token = val.data['token'];
                        Fluttertoast.showToast(
                          msg: 'Authenticated',
                        );
                        Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) {
                            //
                            return welcomescreeninfo();
                          },
                        ));
                      }
                    });
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          "LogIn",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 150,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xffffae88), Color(0xff8f93ea)],
                ),
              ),
              child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return RegisterScreen();
                      },
                    ));
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
