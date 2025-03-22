import 'package:flutter/material.dart';
import 'package:kilo_project/pages/intro.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kilo_project/pages/language_setup.dart';

class Language extends StatefulWidget {
  static const String id = 'language';

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  // String dropdownValueLanguage = supportedLanguages[0].toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 420.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0),
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/language.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(("selectLang").tr(),style: TextStyle(fontFamily: 'Original Surfer',color: Color(0xFF65C7F7)),),
              TextButton(onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LanguageSetup()));
              },child: Text(("lang").tr(),style: TextStyle(fontFamily: 'Original Surfer',color: Color(0xFF65C7F7)),),),
              SizedBox(
                width: 20.0,
              ),
              FloatingActionButton(
                  child: Container(
                    width: 60,
                    height: 60,
                    child: Icon(
                      Icons.play_arrow,
                      size: 40,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient:
                            LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [Color(0xFF9CECFB), Color(0xFF65C7F7),Color(0xFF0052D4)])),
                  ),
                  onPressed: () {
                      Navigator.pushNamed(context, Intro.id);

                  }),
            ],
          ),
        ],
      ),
    );
  }
}
