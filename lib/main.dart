import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kilo_project/pages/language.dart';
import 'package:kilo_project/pages/language_setup.dart';
import 'package:kilo_project/pages/loading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kilo_project/pages/intro.dart';
import 'package:kilo_project/pages/home.dart';
import 'package:kilo_project/pages/snap_it.dart';
import 'package:kilo_project/pages/find_it.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
        Locale('fr', 'FR'),
        Locale('es', 'SP'),
        Locale('it', 'IT')
      ],
      path: 'assets/languages',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        EasyLocalization.of(context).delegate,
      ],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: Loading.id,
      routes: <String, WidgetBuilder>{
        Loading.id: (context) => Loading(),
        Language.id: (context) => Language(),
        Intro.id: (context) => Intro(),
        Home.id: (context) => Home(),
        SnapIt.id: (context) => SnapIt(),
        FindIt.id: (context) => FindIt(),
        LanguageSetup.id:(context)=>LanguageSetup(),
      },
    );
  }
}
