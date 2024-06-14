import 'package:flutter/material.dart';
import 'singnup.dart';

import 'constants.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //Email Field
                                Text(
                                  "Email",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: conheight * .01,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: violy1,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: conheight * .03,
                                ),
                                Text(
                                  "password",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: conheight * .01,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.password_outlined,
                                        color: violy1,
                                      ),
                                    ),
                                    obscureText: true,
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
                                        onPressed: () {},
                                        child: Text("Login"),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
