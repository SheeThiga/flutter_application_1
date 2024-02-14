import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/login_screen.dart';
import 'package:flutter_application_1/views/screens/registration_screen.dart';
import 'configs/constants.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var activeScreen = 'login_screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'registration_screen';
    });
  }

  void switchScreenBack() {
    setState(() {
      activeScreen = 'login_screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = LoginScreen(switchScreen);

    if (activeScreen == 'registration_screen') {
      screenWidget = RegistrationScreen(switchScreenBack);
    }
    if (activeScreen == 'login_screen') {
      screenWidget = LoginScreen(switchScreen);
    }

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
          child: Center(child: screenWidget),
        ),
      ),
    );
  }
}
