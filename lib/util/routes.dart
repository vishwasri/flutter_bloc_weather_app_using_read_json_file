import 'package:flutter/material.dart';
import 'package:hs_test/util/colors.dart';
import 'package:hs_test/view/home_screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class MyRoutes {
  static Map<String, Widget Function(BuildContext)> allRoutes() {
    return {
      '/': (context) => SplashScreenView(
            home: HomeScreen(),
            duration: 3000,
            imageSize: 200,
            imageSrc: 'asset/weather.png',
            backgroundColor: WHITE,
          ),
      '/home': (context) => HomeScreen(),
    };
  }
}
