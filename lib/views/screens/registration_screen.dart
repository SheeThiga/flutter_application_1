import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/constants.dart';
import 'package:flutter_application_1/views/widgets/back_ground.dart';
import 'package:flutter_application_1/views/widgets/custom_button.dart';
import 'package:flutter_application_1/views/widgets/custom_field.dart';
import 'package:get/get.dart';
import '../widgets/custom_text.dart';
import 'package:http/http.dart' as http;

final TextEditingController firstnameController = TextEditingController();
final TextEditingController secondnameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class RegistrationScreen extends GetView {
  const RegistrationScreen({super.key});

  @override
  Widget build(context) {
    return Material(
      child: Scaffold(
        body: BackGround(
          widget: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  label: 'Create an Account',
                  labelColor: appWhiteColor,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(color: Colors.limeAccent, width: 1),
                  )),
                  child: InkWell(
                    onTap: () => Get.toNamed("/login"),
                    child: const CustomText(
                      label: 'Already have an account? sign in',
                      labelColor: Colors.limeAccent,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: CustomTextField(
                    controller: firstnameController,
                    hintMessage: "First Name",
                    style: const TextStyle(color: appWhiteColor),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: CustomTextField(
                    controller: secondnameController,
                    hintMessage: "Second Name",
                    style: const TextStyle(color: appWhiteColor),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: CustomTextField(
                    controller: emailController,
                    hintMessage: "Email",
                    style: const TextStyle(color: appWhiteColor),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: CustomTextField(
                    controller: passwordController,
                    hintMessage: "Enter password",
                    hideText: true,
                    isPassword: true,
                    style: const TextStyle(color: appWhiteColor),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomButton(
                  label: 'Create Account ',
                  buttonColor: primaryColor,
                  action: () async {
                    await serverSignup();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> serverSignup() async {
    try {
      http.Response response;
      var body = {
        "firstname": firstnameController.text.trim(),
        "secondname": secondnameController.text.trim(),
        "user_email": emailController.text.trim(),
        "user_password": passwordController.text.trim(),
      };

      response = await http.post(
        Uri.parse("https://nzembi.tech/mercy_cereal_shop/userTable/signup.php"),
        headers: {"content-type": "application/x-www-form-urlencoded"},
        body: body,
      );

      if (response.statusCode == 200) {
        var serverResponse = json.decode(response.body);
        int signedUp = serverResponse['success'];
        if (signedUp == 1) {
          print("ok");
          await Get.toNamed("/login");
          print("Account created successfully");
        }
      }
      print(response.body);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
