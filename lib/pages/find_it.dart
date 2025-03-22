import 'package:flutter/material.dart';
import 'package:awesome_button/awesome_button.dart';
import 'package:kilo_project/pages/camera_static_image.dart';
import 'package:kilo_project/pages/static_image_page.dart';
import 'package:easy_localization/easy_localization.dart';

class FindIt extends StatefulWidget {
  static const String id = 'find_it';

  @override
  _FindItState createState() => _FindItState();
}

class _FindItState extends State<FindIt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient:LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              Colors.white,
              Colors.white70,
              Colors.white70,
              Color(0xFFF37335),
            ],
          ),),
        child: Column(
          children: [
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Icon(Icons.arrow_back_rounded,size: 40.0,color: Color(0xFFF37335),)),
                TextButton(onPressed: (){

                }, child: Icon(Icons.info_outlined,size: 35.0,color: Color(0xFFF37335),)),
              ],
            ),
            Container(
              margin: EdgeInsets.all(40.0),
              height: 218,
              width: 285,
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(20.0),image: DecorationImage(image:AssetImage('assets/images/fan.png'))),
            ),
            Container(margin:EdgeInsets.all(25.0),child: Text(("finitinfo").tr(), style: TextStyle(
              fontFamily: 'Original Surfer',
              color:Color(0xFFF37335),
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),textAlign: TextAlign.center,),),
            Container(
              margin:EdgeInsets.all(30.0) ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AwesomeButton(
                    blurRadius: 10.0,
                    splashColor: Color.fromRGBO(255, 255, 255, .4),
                    borderRadius: BorderRadius.circular(25.0),
                    height: 50.0,
                    width: 130.0,
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => FindIt()));
                    },
                    color: Colors.white,
                    child: Text(
                    ("newobject").tr(),
                      style: TextStyle(
                        fontFamily: 'Original Surfer',
                        color:Color(0xFFF37335),
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  AwesomeButton(
                    blurRadius: 10.0,
                    splashColor: Color.fromRGBO(255, 255, 255, .4),
                    borderRadius: BorderRadius.circular(25.0),
                    height: 50.0,
                    width: 130.0,
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => CameraStaticImage()));
                    },
                    color: Color(0xFFF37335),
                    child: Text(
                     ("gofind").tr(),
                      textAlign: TextAlign.center,

                      style: TextStyle(
                        fontFamily: 'Original Surfer',
                        color: Colors.white,
                        fontSize: 20.0,
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
