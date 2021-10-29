import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebese_auth/methods/authentication.dart';
// import 'package:firebese_auth/models/unsplash.dart';
import 'package:firebese_auth/screens/homeScreen.dart';
import 'package:firebese_auth/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class LoginScreen2 extends StatefulWidget {
  @override
  _LoginScreen2State createState() => _LoginScreen2State();
}

String userEmail = '';

String userNAme = '';

String photoUrl = '';

String id = '';

String idToken = '';

String accessToken = '';

class _LoginScreen2State extends State<LoginScreen2> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isLogin = false;
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    final _formkey = GlobalKey<FormState>();

    String email = '';
    String password = '';
    String username = '';
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 218, 0, 1),
      body: Form(
        key: _formkey,
        child: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                height: _height * 1,
              ),
              Container(
                padding: EdgeInsets.only(top: 50, left: 30, right: 30),
                alignment: Alignment.topCenter,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    !isLogin ? "Signup" : "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
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
                                key: ValueKey("username"),

                                decoration: InputDecoration(
                                  hintText: "Username",
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.7)),
                                  labelStyle: new TextStyle(
                                      color: const Color(0xFF424242)),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                ),
                                // keyboardType:KeyboardKe
                                controller: _usernameController,
                              ),
                              SizedBox(
                                height: _height * 0.02,
                              ),
                              TextFormField(
                                key: ValueKey("password"),
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.7)),
                                  labelStyle: new TextStyle(
                                      color: const Color(0xFF424242)),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                ),
                                // keyboardType:KeyboardKe
                                // controller: _passwordController,
                              ),
                              SizedBox(
                                height: _height * 0.01,
                              ),
                              !isLogin
                                  // ignore: dead_code
                                  ? TextFormField(
                                      key: ValueKey("email"),
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7)),
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
                                      // controller: _usernameController,
                                    )
                                  : Container(),
                              SizedBox(
                                height: _height * 0.01,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forgot Password",
                                    style: TextStyle(color: Colors.amber),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: _height * 0.037,
                              ),
                              InkWell(
                                onTap: () {
                                  if (_formkey.currentState!.validate()) {
                                    _formkey.currentState!.save();
                                    isLogin
                                        ? signin(email, password)
                                        : signup(email, password);
                                  }
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
                                    isLogin ? 'Login' : 'Signup',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: _height * 0.028,
                              ),
                              TextButton(
                                onPressed: () {
                                  print("login:$isLogin");
                                  setState(() {
                                    isLogin = !isLogin;
                                    print(isLogin);
                                  });
                                  print("out:$isLogin");
                                },
                                child: !isLogin
                                    ? Text('Already Signed Up? Login')
                                    : Text("Don't have an account? Signup"),
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
      ),
    );
  }
}

Future<UserCredential> signInGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  userEmail = googleUser!.displayName;
  userNAme = googleUser.email;
  photoUrl = googleUser.photoUrl;
  id = googleUser.id;
  idToken = googleAuth!.idToken;
  accessToken = googleAuth.accessToken;

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
