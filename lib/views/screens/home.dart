import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/constants.dart';
import 'package:flutter_application_1/controllers/home_controller.dart';
import 'package:flutter_application_1/views/screens/dashboard_screen.dart';
import 'package:flutter_application_1/views/screens/profile.dart';
import 'package:flutter_application_1/views/screens/sales_screen.dart';
import 'package:flutter_application_1/views/screens/settings.dart';
import 'package:get/get.dart';

HomeController homeController = Get.put(HomeController());
var screens = [
 DashboardScreen(),
  SalesScreen(),
  ProfileScreen(),
  const SettingScreen(),
];

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: appWhiteColor,
          color: primaryColor,
          items: const [
            Icon(Icons.home),
            Icon(Icons.receipt),
            Icon(Icons.person),
            Icon(Icons.settings)
          ],
          onTap: (index) {
            homeController.updateSelectedPage(index);
            print("Clicked on tab $index");
          }),
      body: Obx(
        () => Center(child: screens[homeController.selectedPage.value]),
      ),
    );
  }
}
