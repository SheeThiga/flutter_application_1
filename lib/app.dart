import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/login_screen.dart';
import 'package:flutter_application_1/views/widgets/back_ground.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(context) {
    return const Scaffold(
      body: BackGround(
        widget: Center(
          child: LoginScreen(),
        ),
      ),
    );
  }
}
