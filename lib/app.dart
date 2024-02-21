import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/login_screen.dart';
import 'configs/constants.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(context) {
    return Scaffold(
      body: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [appBlackColor, Colors.black12],
          begin: Alignment.bottomCenter,
          end: Alignment.center,
        ).createShader(bounds),
        blendMode: BlendMode.darken,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/grains.png',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black45,
                BlendMode.darken,
              ),
            ),
          ),
          child: const Center(
            child: LoginScreen(),
          ),
        ),
      ),
    );
  }
}
