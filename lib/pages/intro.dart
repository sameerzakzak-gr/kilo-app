import 'package:flutter/material.dart';
import 'package:kilo_project/pages/home.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:easy_localization/easy_localization.dart';


class Intro extends StatefulWidget {
  static const String id = 'intro';

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    // Making list of pages needed to pass in IntroViewsFlutter constructor.
    final pages = [
      PageViewModel(
        pageBackground: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.topRight,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.white,
                Colors.white70,
                Colors.white70,
                Color(0xFFF37335),
              ],
            ),
          ),
        ),
        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Image.asset('assets/images/logo.png'),
        body:  Text(("intro1").tr()
        ),
        title: Text(
          ("title").tr(),
        ),
        titleTextStyle:
        const TextStyle(fontSize:40.0,fontFamily: 'Original Surfer', color: Color(0xFFF37335),fontWeight: FontWeight.bold),
        bodyTextStyle: const TextStyle(fontSize:18.0,fontFamily: 'Original Surfer', color: Colors.black45,fontWeight: FontWeight.bold),
        mainImage: Image.asset(
          'assets/images/page30.jpg',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ),
      ),
      PageViewModel(
        pageBackground: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.white,
                Colors.white70,
                Colors.white70,
                Color(0xFFF37335),
              ],
            ),
          ),
        ),
        iconImageAssetPath: 'assets/images/logo.png',
        body:  Text(
          ("intro2").tr(),
        ),
        title: Text(("simple").tr()),
        mainImage: Image.asset(
          'assets/images/page31.jpg',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ),
        titleTextStyle:
        const TextStyle(fontSize:40.0,fontFamily: 'Original Surfer', color: Color(0xFFF37335),fontWeight: FontWeight.bold),
        bodyTextStyle: const TextStyle(fontSize:18.0,fontFamily: 'Original Surfer', color: Colors.black45,fontWeight: FontWeight.bold),
      ),
      PageViewModel(
        pageBackground: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.white,
                Colors.white70,
                Colors.white70,
                Color(0xFFF37335),
              ],
            ),
          ),
        ),
        iconImageAssetPath: 'assets/images/logo.png',
        body: Text(
            ("intro3").tr()
        ),
        title: Text(("learning").tr()),
        mainImage: Image.asset(
          'assets/images/page32.jpg',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ),
        titleTextStyle:
        const TextStyle(fontSize:40.0,fontFamily: 'Original Surfer', color: Color(0xFFF37335),fontWeight: FontWeight.bold),
        bodyTextStyle: const TextStyle(fontSize:18.0,fontFamily: 'Original Surfer', color: Colors.black45,fontWeight: FontWeight.bold),
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          showNextButton: true,
          showBackButton: true,
          doneText: Text(("done").tr()),
          nextText: Text(("next").tr()),
          backText: Text(("back").tr()),
          skipText: Text(("skip").tr()),
          onTapDoneButton: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Home()),
            );
          },
          pageButtonTextStyles: const TextStyle(
            fontFamily: 'Original Surfer',
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
