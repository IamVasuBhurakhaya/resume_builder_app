import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_builder_app/routes/app_routes.dart';

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
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xC0DEEf),
      ),
    );
  }
}
