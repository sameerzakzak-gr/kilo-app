import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'language.dart';
class Loading extends StatefulWidget {
  static const String id ='loading';

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: Language(),
      duration: 5000,
      imageSize: 130,
      imageSrc: "assets/images/logo.png",
      text: "Welcome Kids",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontFamily: 'Original Surfer',
        fontSize: 40.0,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.white,
    );
  }
}
