// @dart=2.9
import 'dart:ui';

import 'package:firebese_auth/screens/wallpaperScreen.dart';
import 'package:firebese_auth/unsplashApi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatelessWidget {
  String userEmail = '';
  String userNAme = '';
  String photoUrl = '';
  String id = '';
// String idToken = '';
// String accessToken = '';
  Map<String, String> urls = {
    "Nature":
        "https://images.unsplash.com/photo-1469474968028-56623f02e42e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzEyNTd8MHwxfHNlYXJjaHwyfHxuYXR1cmV8ZW58MHx8fHwxNjM1MzI5ODMy&ixlib=rb-1.2.1&q=80&w=400",
    "Technology":
        "https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzEyNTd8MHwxfHNlYXJjaHwzfHx0ZWNofGVufDB8fHx8MTYzNTMzMTEwNw&ixlib=rb-1.2.1&q=85",
    "Beach":
        "https://images.unsplash.com/photo-1506929562872-bb421503ef21?ixid=MnwyNzEyNTd8MHwxfHNlYXJjaHwyMXx8YmVhY2h8ZW58MHx8fHwxNjM1NDAwMjYz&ixlib=rb-1.2.1",
    "Space":
        "https://images.unsplash.com/photo-1528722828814-77b9b83aafb2?ixid=MnwyNzEyNTd8MHwxfHNlYXJjaHw2fHxzcGFjZXxlbnwwfHx8fDE2MzU0MDA0MTc&ixlib=rb-1.2.1"
  };

  HomeScreen({this.userEmail, this.userNAme, this.photoUrl, this.id});

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 25, 50, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(27, 25, 50, 1),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Categories'),
      ),
      body: SafeArea(
          child: Container(
        child: Stack(children: [
          ListView.builder(
            itemCount: urls.keys.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: _height * 0.02),
                child: InkWell(
                  onTap: () {
                    // print();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Wallpaper(
                            category: urls.keys.elementAt(index),
                          );
                        },
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      alignment: Alignment.center,
                      height: _height * 0.7,
                      width: _width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(urls.values.elementAt(index)),
                            fit: BoxFit.cover,
                            scale: 1),
                        shape: BoxShape.rectangle,
                      ),
                      child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 1.3,
                            sigmaY: 1.3,
                            tileMode: TileMode.clamp,
                          ),
                          child: Text(
                            urls.keys.elementAt(index),
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          )),
                    ),
                  ),
                ),
              );
            },
          )
        ]),
      )),
    );
  }
}
