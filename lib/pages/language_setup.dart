import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kilo_project/pages/language.dart';

class LanguageSetup extends StatelessWidget {
  static const String id = 'language_setup';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient:LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.white,
                Colors.white70,
                Color(0xFFF37335),
                Color(0xFFF37335),
              ],
            ),),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40.0),
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/logo.png'))),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient:LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.white,

                      Color(0xFFF37335),
                    ],
                  ),),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 26),
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: Center(
                        child: Text(("changeLang").tr(),style: TextStyle(
                          fontFamily: 'Original Surfer',
                          color:Color(0xFFF37335),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    buildSwitchListTileMenuItem(
                        context: context,
                        title: 'en-US',
                        locale: context.supportedLocales[0]),
                    buildDivider(),
                    buildSwitchListTileMenuItem(
                        context: context,
                        title: 'ar-SA',
                        locale: context.supportedLocales[1]),
                    buildDivider(),
                    buildSwitchListTileMenuItem(
                        context: context,
                        title: 'fr-FR',
                        locale: context.supportedLocales[2]),
                    buildDivider(),
                    buildSwitchListTileMenuItem(
                        context: context,
                        title: 'es-SP',
                        locale: context.supportedLocales[3]),
                    buildDivider(),
                    buildSwitchListTileMenuItem(
                        context: context,
                        title: 'it-IT',
                        locale: context.supportedLocales[4]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildDivider() => Container(
        margin: EdgeInsets.symmetric(horizontal: 24.0),
        child: Divider(
          thickness: 3.0,
          color: Colors.white,
        ),
      );
  Container buildSwitchListTileMenuItem(
      {BuildContext context, String title, Locale locale}) {
    return Container(

      margin: EdgeInsets.only(left: 10.0, right: 10.0, ),
      child: ListTile(
        dense: true,
        title: Center(child: Text(title,style: TextStyle(
          fontFamily: 'Original Surfer',
          color:Colors.black87,
          fontSize: 15.0,
          fontWeight: FontWeight.bold
        ),)),
        onTap: () {
          Navigator.pop(context);
          // ignore: deprecated_member_use
          context.locale = locale;
          Navigator.pushNamed(context, Language.id);
        },
      ),
    );
  }
}
