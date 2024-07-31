import 'package:flutter/material.dart';
import 'package:resume_builder_app/views/build_option_page/build_option_page.dart';
import 'package:resume_builder_app/views/home_page/home_page.dart';

class AppRoutes {
  static String homePage = "/";
  static String buildOptionPage = "build_option_page";

  static String iconPath = "lib/assets/icons";

  static List<Map<String, dynamic>> allOption = [
    {
      'icon': "${iconPath}contact-detail.png",
      'title': "Contact Info",
      'route': "contact_info_page",
    },
    {
      'icon': "${iconPath}briefcase.png",
      'title': "Carrier Objective",
      'route': "carrier_objective_page",
    },
    {
      'icon': "${iconPath}account.png",
      'title': "Personal Details",
      'route': "personal_details_page",
    },
    {
      'icon': "${iconPath}graduation-cap.png",
      'title': "Education",
      'route': "education_page",
    },
    {
      'icon': "${iconPath}logical-thinking.png",
      'title': "Experiences",
      'route': "experiences_page",
    },
    {
      'icon': "${iconPath}certificate.png",
      'title': "Technical Skills",
      'route': "technical_skills_page",
    },
    {
      'icon': "${iconPath}open-book.png",
      'title': "Interests/Hobbies",
      'route': "interests_hobbies_page",
    },
    {
      'icon': "${iconPath}project-management.png",
      'title': "Projects",
      'route': "projects_page",
    },
    {
      'icon': "${iconPath}target.png",
      'title': "Achievements",
      'route': "achievements_page",
    },
    {
      'icon': "${iconPath}handshake.png",
      'title': "References",
      'route': "references_page",
    },
    {
      'icon': "${iconPath}declaration.png",
      'title': "Declaration",
      'route': "declaration_page",
    },
  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    homePage: (context) => const HomePage(),
    buildOptionPage: (context) => const BuildOptionPage(),
  };
}
