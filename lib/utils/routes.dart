import 'package:flutter_application_1/app.dart';
import 'package:flutter_application_1/views/calculator.dart';
import 'package:flutter_application_1/views/screens/dashboard_screen.dart';
import 'package:flutter_application_1/views/screens/home.dart';
import 'package:flutter_application_1/views/screens/login_screen.dart';
import 'package:flutter_application_1/views/screens/profile.dart';
import 'package:flutter_application_1/views/screens/registration_screen.dart';
import 'package:flutter_application_1/views/screens/settings.dart';
import 'package:get/get.dart';

class Routes {
  static var routes = [
    GetPage(name: "/", page: () => const App()),
    GetPage(name: "/login", page: () => const LoginScreen()),
    GetPage(name: "/home", page: () => const Home()),
    GetPage(name: "/dashboard", page: () =>  DashboardScreen()),
    GetPage(name: "/calculator", page: () => const Calculator()),
    GetPage(name: "/registration", page: () => const RegistrationScreen()),
    GetPage(name: "/profile", page: () => ProfileScreen()),
    GetPage(name: "/setting", page: () => const SettingScreen()),
  ];
}
