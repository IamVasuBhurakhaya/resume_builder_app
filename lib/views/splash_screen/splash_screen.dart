import 'package:flutter/material.dart';
import 'package:resume_builder_app/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
    });

    return Scaffold(
      body: Center(
        child: Image.network("assets/images/splash_screen.gif"),
      ),
    );
  }
}