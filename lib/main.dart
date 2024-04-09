import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: Routes.routes,
    ),
  );
}
