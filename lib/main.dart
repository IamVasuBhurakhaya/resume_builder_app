import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_builder_app/routes/app_routes.dart';
//https://coolors.co/palettes/trending
//d4a373
//e9edc9
//fefae0
//faedcd
//d4a373

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color(0xffccd5ae),
            iconSize: 35,
            splashColor: Color(0xfffaedcd)),
        scaffoldBackgroundColor: Color(0xfffefae0),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xfffefae0)),
      ),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
    );
  }
}
