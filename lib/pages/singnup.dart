import 'package:chatter/pages/signin.dart';
import 'package:chatter/services/auth_services.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;
  late String _confirmPassword;
  late String _name;

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
                        "Signup",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Center(
                        child: Text(
                          'Create your Account',
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
                            height: conheight / 1.8,
                            width: conwidth,
                            decoration: BoxDecoration(
                              color: whyte1,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Name",
                                      prefixIcon: Icon(
                                        Icons.verified_user_sharp,
                                        color: violy1,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter your name";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) => _name = value!,
                                  ),
                                  // Email field
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Email",
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: violy1,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter your email";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) => _email = value!,
                                  ),
                                  // Password field
                                  TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      prefixIcon: Icon(
                                        Icons.password_rounded,
                                        color: violy1,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.length < 8) {
                                        return "Password must be at least 8 characters";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) => _password = value!,
                                  ),
                                  // Confirm Password field
                                  TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: "Confirm Password",
                                      prefixIcon: Icon(
                                        Icons.password_outlined,
                                        color: violy1,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value != _password) {
                                        return "Passwords do not match";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) =>
                                        _confirmPassword = value!,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Signin(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Already have an account?",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: conheight * .05,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: violy2,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _formKey.currentState!.save();
                                            // Call the AuthService to sign up
                                            AuthService()
                                                .signup(_email, _password);
                                          }
                                        },
                                        child: Text(
                                          "Sign up",
                                          style: TextStyle(color: whyte1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
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
