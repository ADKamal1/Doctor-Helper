import 'package:doctor_helper/pages/auth/register_base_info.dart';
import 'package:doctor_helper/pages/home/home_page.dart';
import 'package:doctor_helper/utils/consts.dart';
import 'package:doctor_helper/widgets/TheTextFormFeild.dart';
import 'package:doctor_helper/widgets/the_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/signup_top.png',
                width: size.width * .3,
              ),
            ),
            Positioned(
              top: 35,
              left: 5,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'assets/images/login_bottom.png',
                width: size.width * .3,
              ),
            ),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: scrollPhysics,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil().setHeight(50),
                    ),
                    Text(
                      'LOGIN to $appName'.toUpperCase().replaceAll(' ', '  '),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
//                  SizedBox(
//                    height: ScreenUtil().setHeight(13),
//                  ),
//                  Image.asset(
//                    'assets/images/login.png',
//                    width: size.width * .45,
//                    height: size.height * .25,
//                    fit: BoxFit.fill,
//                  ),
                    SizedBox(
                      height: ScreenUtil().setHeight(18),
                    ),
                    TheTextFormField(
                      obscureText: false,
                      width: size.width * .9,
                      onSaved: (input) => input = _email,
                      validator: (input) {
                        if (!validateEmail(input)) {
                          return 'enter valid email';
                        }
                      },
                      hint: 'Your E-mail',
                      prefixIcon: Icon(
                        Icons.email,
                        color: mainColor,
                      ),
                    ),
                    TheTextFormField(
                      width: size.width * .9,
                      obscureText: true,
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.visibility_off,
                          color: mainColor,
                        ),
                        onPressed: () {},
                      ),
                      onSaved: (input) => input = _password,
                      validator: (input) {
                        if (input.length < 6) {
                          return 'Longer password please';
                        }
                      },
                      hint: 'Your password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: mainColor,
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(15),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(18),
                          vertical: ScreenUtil().setHeight(5),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ForgotPasswordPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Forget  password'.toUpperCase(),
                            style: TextStyle(fontSize: 14, color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    TheButton(
                      onTap: () {
                        signIn();
                        if (_formKey.currentState.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }
                      },
                      title: 'LOGIN',
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(48),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(18),
                          vertical: ScreenUtil().setHeight(5),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => RegisterBaseInfo(),
                              ),
                            );
                          },
                          child: Text(
                            'Create  account'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 18,
                              color: mainColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(48),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        User user = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _email, password: _password) as User;
      } catch (e) {
        print(e.massage);
      }
    }
  }

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }
}
