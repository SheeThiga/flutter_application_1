import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/home_controller.dart';
import 'package:flutter_application_1/views/calculator.dart';
import 'package:flutter_application_1/views/screens/dashboard_screen.dart';
import 'package:get/get.dart';

HomeController homeController = Get.put(HomeController());
var screens = [
  const DashboardScreen(),
  const Calculator(),
  const Calculator(),
];

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cereal Shop'),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: Colors.lime,
          items: const [
            Icon(Icons.home),
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
