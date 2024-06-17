import 'package:chatter/consts_logics.dart';
import 'package:flutter/material.dart';
import 'singnup.dart';

import '../constants.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _loginFormKey = GlobalKey<FormState>();
  String? _email, _password;

  @override
  Widget build(BuildContext context) {
    var conheight = MediaQuery.of(context).size.height;
    var conwidth = MediaQuery.of(context).size.width;
    double topPadding = conheight * 0.1;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                height: conheight / 3.5,
                width: conwidth,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [violy1, violy2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(conwidth, 105),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: topPadding),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "SignIn",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Center(
                        child: Text(
                          'Login to your Account',
                          style: TextStyle(
                            color: whyte2,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Material(
                          color: whyte1,
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            height: conheight / 2.5,
                            width: conwidth,
                            decoration: BoxDecoration(
                              color: whyte1,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Form(
                              key: _loginFormKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //Email Field
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter an email';
                                      } else if (!EMAIL_VALIDATION_REGEX
                                          .hasMatch(value)) {
                                        return 'Please enter a valid email';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) => _email = value,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.black),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.black),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: violy1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: conheight * .03,
                                  ),
                                  //Password Field
                                  TextFormField(
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a password';
                                      } else if (!PASSWORD_VALIDATION_REGEX
                                          .hasMatch(value)) {
                                        return 'Please enter a valid paasssword';
                                      }
                                      return null;
                                      //validation
                                    },
                                    onSaved: (value) => _password = value,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.black),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.black),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.password_outlined,
                                        color: violy1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: conheight * .01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Forgot Password ?",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Singup()),
                                          );
                                        },
                                        child: Text("Create an account. "),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: conheight * .01,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButtonTheme(
                                        data: kElevatedButtonStyle,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (_loginFormKey.currentState!
                                                .validate()) {
                                              _loginFormKey.currentState!
                                                  .save();
                                              // Login logic here
                                              print(
                                                  'Email: $_email, Password: $_password');
                                            }
                                          },
                                          child: Text("Login"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
