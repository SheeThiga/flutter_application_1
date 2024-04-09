import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/widgets/back_ground.dart';
import 'package:flutter_application_1/views/widgets/custom_field.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../configs/constants.dart';
import '../widgets/custom_text.dart';

final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(context) {
    return Material(
      child: Scaffold(
        body: BackGround(
          widget: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      label: 'JUANCO Enterprises',
                      labelColor: appWhiteColor,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 50.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 100,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: CustomTextField(
                        controller: usernameController,
                        hintMessage: "Email",
                        icon: Icons.email,
                        style: const TextStyle(color: appWhiteColor),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: CustomTextField(
                        controller: passwordController,
                        hintMessage: "Password",
                        icon: Icons.lock,
                        hideText: true,
                        isPassword: true,
                        style: const TextStyle(color: appWhiteColor),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const CustomText(
                              label: "Forgot Password?",
                              labelColor: appWhiteColor,
                              fontSize: 15.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    //
                    MaterialButton(
                      onPressed: () {
                        remoteLogin();
                      },
                      height: 50.0,
                      minWidth: 50,
                      color: Colors.limeAccent,
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 30.0),
                    InkWell(
                      onTap: () => Get.toNamed("/registration"),
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(color: Colors.limeAccent, width: 1),
                          ),
                        ),
                        child: const CustomText(
                          label: "Don't have an account? Sign up here.",
                          labelColor: Colors.limeAccent,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> remoteLogin() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://nzembi.tech/mercy_cereal_shop/userTable/login.php?user_email=${usernameController.text.trim()}&user_password=${passwordController.text.trim()}"));
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      int loginStatus = serverResponse['success'];
      if (loginStatus == 1) {
        Get.toNamed("/home");
        print("Login Success");
      } else {
        print("Invalid email or password");
      }
    } else {
      print("Server Error ${response.statusCode}");
    }
  }
}
