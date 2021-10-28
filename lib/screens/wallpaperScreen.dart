// @dart=2.9

import 'package:firebese_auth/unsplashApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
// import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class Wallpaper extends StatefulWidget {
  String category = '';

  Wallpaper({this.category});

  @override
  _WallpaperState createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    // var exeTime;
    setWallpaper(url) async {
      int location = WallpaperManager.HOME_SCREEN; //can be Home/Lock Screen
      var file = await DefaultCacheManager().getSingleFile(url);
      try {
        bool result =
            await WallpaperManager.setWallpaperFromFile(file.path, location);
      } catch (e) {
        print(e);
      }

      if (!mounted) return "error";
    }

    return Scaffold(
        body: Container(
      child: FutureBuilder(
        future: apiResponse(widget.category),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(widget.category);
            return Swiper(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.network(
                        snapshot.data[index]['urls']['full'] != null
                            ? snapshot.data[index]['urls']['full']
                            : Center(child: CircularProgressIndicator()),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(
                          bottom: _height * 0.03, left: 37, right: 37),
                      child: InkWell(
                        onTap: () {
                          setWallpaper(snapshot.data[index]['urls']['full']);
                          print("wallapaper set");
                        },
                        child: BottomBar(height: _height, width: _width),
                      ),
                    )
                  ],
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ));
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
    @required double height,
    @required double width,
  })  : _height = height,
        _width = width,
        super(key: key);

  final double _height;
  final double _width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          height: _height * 0.067,
          width: _width * 0.6,
          decoration: BoxDecoration(
              color: Color.fromRGBO(32, 26, 59, 1),
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            "Set Wallpaper",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          child: IconButton(
              // padding: EdgeInsets.only(right: 1),
              color: Color.fromRGBO(32, 26, 59, 1),
              onPressed: () {},
              iconSize: 30,
              icon: Icon(Icons.favorite)),
        )
      ],
    );
  }
}
