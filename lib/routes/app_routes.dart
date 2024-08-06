import 'package:flutter/material.dart';
import 'package:resume_builder_app/views/build_option_page/allOptions/achievements_page/achievements_page.dart';
import 'package:resume_builder_app/views/build_option_page/allOptions/carrier_objective/carrier_objective_page.dart';
import 'package:resume_builder_app/views/build_option_page/allOptions/contact_info/contact_info_page.dart';
import 'package:resume_builder_app/views/build_option_page/allOptions/declaration_page/declaration_page.dart';
import 'package:resume_builder_app/views/build_option_page/allOptions/education_page/education_page.dart';
import 'package:resume_builder_app/views/build_option_page/allOptions/experience_page/experience_page.dart';
import 'package:resume_builder_app/views/build_option_page/allOptions/interests_hobbies_page/interests_hobbies_page.dart';
import 'package:resume_builder_app/views/build_option_page/allOptions/personal_detail_page/personal_detail_page.dart';
import 'package:resume_builder_app/views/build_option_page/allOptions/projects_page/projects_page.dart';
import 'package:resume_builder_app/views/build_option_page/allOptions/references_page/references_page.dart';
import 'package:resume_builder_app/views/build_option_page/allOptions/technical_skill_page/technical_skill_page.dart';
import 'package:resume_builder_app/views/build_option_page/build_option_page.dart';
import 'package:resume_builder_app/views/home_page/home_page.dart';
import 'package:resume_builder_app/views/splash_screen/splash_screen.dart';

class AppRoutes {
  static String splashScreen = "/";
  static String homePage = "home_page";
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
    splashScreen: (context) => const SplashScreen(),
    homePage: (context) => const HomePage(),
    buildOptionPage: (context) => const BuildOptionPage(),
    allOption[0]['route']: (context) => const ContactInfoPage(),
    allOption[1]['route']: (context) => const CarrierObjectivePage(),
    allOption[2]['route']: (context) => const PersonalDetailPage(),
    allOption[3]['route']: (context) => const EducationPage(),
    allOption[4]['route']: (context) => const ExperiencePage(),
    allOption[5]['route']: (context) => const TechnicalSkillPage(),
    allOption[6]['route']: (context) => const InterestsHobbiesPage(),
    allOption[7]['route']: (context) => const ProjectsPage(),
    allOption[8]['route']: (context) => const AchievementsPage(),
    allOption[9]['route']: (context) => const ReferencesPage(),
    allOption[10]['route']: (context) => const DeclarationPage(),
  };
}
