import 'dart:ui';

import 'package:firebese_auth/methods/authentication.dart';
import 'package:firebese_auth/screens/login.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    TextEditingController _usernameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 218, 0, 1),
      body: SafeArea(
        child: Stack(
          // alignment: Alignment.center,
          children: [
            SafeArea(
              child: Stack(
                children: [
                  SizedBox(
                    height: _height * 1,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 50, left: 30, right: 30),
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginScreen();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            print(
                                "$_passwordController,$_emailController,$_usernameController");
                          },
                          child: Text(
                            "SignUp",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _height * 0.2),
                    child: Container(
                      height: _height,
                      width: _width,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(50)),
                        color: Colors.white,
                      ),
                      //
                      child: SingleChildScrollView(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.amber,
                                      maxRadius: 40,
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("images/sunny.jpeg"),
                                        radius: 35,
                                        backgroundColor: Colors.amber,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Welcome!",
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: _height * 0.06,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value.toString().length < 3) {
                                        return 'Username is so small';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      setState(() {
                                        _usernameController.text = value!;
                                      });
                                    },
                                    key: ValueKey("username"),
                                    decoration: InputDecoration(
                                      hintText: "Username",
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.7)),
                                      labelStyle: new TextStyle(
                                          color: const Color(0xFF424242)),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.amber),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.amber),
                                      ),
                                    ),
                                    // keyboardType:KeyboardKe
                                    controller: _usernameController,
                                  ),
                                  SizedBox(
                                    height: _height * 0.02,
                                  ),
                                  TextFormField(
                                    key: ValueKey("emial"),
                                    validator: (value) {
                                      if (!(value.toString().contains('@'))) {
                                        return 'Invalid Email';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      setState(() {
                                        _emailController.text = value!;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.7)),
                                      labelStyle: new TextStyle(
                                          color: const Color(0xFF424242)),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.amber),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.amber),
                                      ),
                                    ),
                                    // keyboardType:KeyboardKe
                                    controller: _emailController,
                                  ),
                                  SizedBox(
                                    height: _height * 0.02,
                                  ),
                                  TextFormField(
                                    key: ValueKey("password"),
                                    validator: (value) {
                                      if (value.toString().length < 6) {
                                        return 'Password is so small';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      setState(() {
                                        _passwordController.text = value!;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.7)),
                                      labelStyle: new TextStyle(
                                          color: const Color(0xFF424242)),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.amber),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.amber),
                                      ),
                                    ),
                                    // keyboardType:KeyboardKe
                                    controller: _passwordController,
                                  ),
                                  SizedBox(
                                    height: _height * 0.1,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      signup(_emailController.text,
                                          _passwordController.text);
                                      Future.delayed(Duration(seconds: 5), () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return LoginScreen();
                                          }),
                                        );
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      height: _height * 0.07,
                                      width: _width * 0.6,
                                      child: Text(
                                        "SIGNUP",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: _height * 0.01,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return LoginScreen();
                                        }),
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Already Signedup",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          width: _width * 0.02,
                                        ),
                                        Text(
                                          "Login",
                                          style: TextStyle(
                                            fontSize: 18,
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.amber,
                                            shadows: [],
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: _height * 0.01,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      Future.delayed(Duration(seconds: 5), () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) {
                                        //       return HomeScreen(
                                        //         photoUrl: photoUrl,
                                        //         userEmail: userEmail,
                                        //         userNAme: userNAme,
                                        //         id: id,
                                        //       );
                                        //     },
                                        //   ),
                                        // );
                                      });
                                      signInGoogle();
                                      print(userEmail);
                                      // setState(() {});
                                    },
                                    child: Container(
                                      alignment: Alignment.bottomLeft,
                                      height: _height * 0.14,
                                      width: _width * 1,
                                      padding: EdgeInsets.only(
                                        right: _height * 0.1,
                                        // top: _height * 0.06,
                                      ),
                                      child: Image(
                                        alignment: Alignment.bottomCenter,
                                        image: NetworkImage(
                                            "https://img.icons8.com/ios-filled/452/google-logo.png"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
