import 'package:flutter/material.dart';
import 'package:awesome_button/awesome_button.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:kilo_project/mini_games/snake/snake.dart';
import 'package:kilo_project/mini_games/tic_tac_toe/TicTacToe.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:kilo_project/pages/live_camera.dart';
import 'package:kilo_project/pages/snap_it.dart';
import 'package:kilo_project/pages/find_it.dart';
import 'package:easy_localization/easy_localization.dart';


import '../main.dart';
import 'language_setup.dart';

class Home extends StatefulWidget {
  static const String id = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _getPage(currentPage),
        bottomNavigationBar: FancyBottomNavigation(
          activeIconColor: Color(0xFFF37335),
          inactiveIconColor: Colors.white,
          circleColor: Colors.white,
          barBackgroundColor: Color(0xFFF37335),
          tabs: [
            TabData(
              iconData: TablerIcons.smart_home,
              title: ("playground").tr(),
              onclick: () => _getPage(0),
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => Page1()))
            ),
            TabData(
              iconData: TablerIcons.settings_automation,
              title: ("settings").tr(),
            ),
          ],
          initialSelection: 0,
          key: bottomNavigationKey,
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        ),
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.linearToSrgbGamma(),
                  image: AssetImage('assets/images/bg.jpg'),
                  fit: BoxFit.cover)),
          child: Container(
            margin: EdgeInsets.only(
                left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      ("objectgames").tr(),
                      style: TextStyle(
                          fontFamily: 'Original Surfer',
                          color: Colors.white,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/logo.png'))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Divider(
                  height: 5.0,
                  thickness: 2,
                  color: Colors.white,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      height: 120.0,
                      width: 600,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFF37335),
                                Color(0xFFFDC830),
                                Color(0xFFFDC830),
                                Color(0xFFF37335),
                              ]),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                           ("snapit").tr(),
                            style: TextStyle(fontFamily: 'Original Surfer',fontSize: 50, color: Colors.white),
                          ),
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 50.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: AwesomeButton(
                        blurRadius: 10.0,
                        splashColor: Color.fromRGBO(255, 255, 255, .4),
                        borderRadius: BorderRadius.circular(25.0),
                        height: 50.0,
                        width: 130.0,
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => SnapIt()));
                        },
                        color: Color(0xFFF37335),
                        child: Text(
                          ("play").tr(),
                          style: TextStyle(
                            fontFamily: 'Original Surfer',
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  height: 20.0,
                  thickness: 3,
                  color: Color(0xFFF37335),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      height: 120.0,
                      width: 600,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFF37335),
                                Color(0xFFFDC830),
                                Color(0xFFFDC830),
                                Color(0xFFF37335),
                              ]),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            ("findit").tr(),
                            style: TextStyle(fontFamily: 'Original Surfer',fontSize: 50, color: Colors.white),
                          ),
                          Icon(
                            Icons.search,
                            size: 50.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: AwesomeButton(
                        blurRadius: 10.0,
                        splashColor: Color.fromRGBO(255, 255, 255, .4),
                        borderRadius: BorderRadius.circular(25.0),
                        height: 50.0,
                        width: 130.0,
                        onTap: () {   Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => FindIt()));},
                        color: Color(0xFFF37335),
                        child: Text(
                          ("play").tr(),
                          style: TextStyle(
                            fontFamily: 'Original Surfer',
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  height: 20.0,
                  thickness: 3,
                  color: Color(0xFFF37335),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      height: 120.0,
                      width: 600,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFF37335),
                                Color(0xFFFDC830),
                                Color(0xFFFDC830),
                                Color(0xFFF37335),
                              ]),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            ("observe").tr(),
                            style: TextStyle(fontFamily: 'Original Surfer',fontSize: 50, color: Colors.white),
                          ),
                          Icon(
                            Icons.remove_red_eye_outlined,
                            size: 50.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: AwesomeButton(
                        blurRadius: 10.0,
                        splashColor: Color.fromRGBO(255, 255, 255, .4),
                        borderRadius: BorderRadius.circular(25.0),
                        height: 50.0,
                        width: 130.0,
                        onTap: () {   Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => LiveCamera(cameras)));},
                        color: Color(0xFFF37335),
                        child: Text(
                          ("play").tr(),
                          style: TextStyle(
                            fontFamily: 'Original Surfer',
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  height: 20.0,
                  thickness: 3,
                  color: Color(0xFFF37335),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        ("minigames").tr(),
                        style: TextStyle(
                            fontFamily: 'Original Surfer',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Divider(
                        height: 5.0,
                        thickness: 2,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 120.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xFFFDC830),
                                      Color(0xFFF37335),
                                    ]),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => SnakeGame()));
                                  },
                                  child: Text(
                                    ("snake").tr(),
                                    style: TextStyle(
                                        fontFamily: 'Original Surfer',
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                ),
                                Icon(

                                  TablerIcons.device_gamepad,
                                  size: 35.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 120.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xFFFDC830),
                                      Color(0xFFF37335),
                                    ]),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => TicTacToe()));
                                  },
                                  child: Text(
                                    ("tictactoe").tr(),
                                    style: TextStyle(
                                        fontFamily: 'Original Surfer',
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                ),
                                Icon(
                                  Icons.gamepad_outlined,
                                  size: 35.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      default:
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.linearToSrgbGamma(),
                  image: AssetImage('assets/images/bg.jpg'),
                  fit: BoxFit.cover)),
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
                Container(
                  height: 250.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/logo.png'))),
                ),
                SizedBox(height: 40.0,),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AwesomeButton(
                        blurRadius: 10.0,
                        splashColor: Color.fromRGBO(255, 255, 255, .4),
                        borderRadius: BorderRadius.circular(25.0),
                        height: 50.0,
                        width: 200.0,
                        onTap: () => print("tapped"),
                        color: Color(0xFFF37335),
                        child: Center(
                          child: Text(
                            ("aboutus").tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Original Surfer',
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.0,),
                      AwesomeButton(
                        blurRadius: 10.0,
                        splashColor: Color.fromRGBO(255, 255, 255, .4),
                        borderRadius: BorderRadius.circular(25.0),
                        height: 50.0,
                        width: 200.0,
                        onTap: () => print("tapped"),
                        color: Color(0xFFF37335),
                        child: Center(
                          child: Text(
                            ("rate").tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Original Surfer',
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.0,),
                      AwesomeButton(
                        blurRadius: 10.0,
                        splashColor: Color.fromRGBO(255, 255, 255, .4),
                        borderRadius: BorderRadius.circular(25.0),
                        height: 50.0,
                        width: 200.0,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LanguageSetup()));
                        },
                        color: Color(0xFFF37335),
                        child: Center(
                          child: Text(
                            ("changelanguage").tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Original Surfer',
                              color: Colors.white,
                              fontSize: 20.0,
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
}
