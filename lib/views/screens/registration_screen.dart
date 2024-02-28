import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/constants.dart';
import 'package:flutter_application_1/views/widgets/back_ground.dart';
import 'package:flutter_application_1/views/widgets/custom_button.dart';
import 'package:flutter_application_1/views/widgets/custom_field.dart';
import 'package:get/get.dart';
import '../widgets/custom_text.dart';

class RegistrationScreen extends GetView {
  const RegistrationScreen({super.key});

  @override
  Widget build(context) {
    final TextEditingController firstnameController = TextEditingController();
    final TextEditingController secondnameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController enterpasswordController =
        TextEditingController();
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
                    controller: enterpasswordController,
                    hintMessage: "re-enter password",
                    hideText: true,
                    isPassword: true,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomButton(
                  label: 'Create Account ',
                  buttonColor: primaryColor,
                  action: () => Get.toNamed("/login"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
