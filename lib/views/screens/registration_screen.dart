import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/constants.dart';
import 'package:flutter_application_1/views/widgets/custom_button.dart';
import 'package:flutter_application_1/views/widgets/custom_field.dart';
import '../widgets/custom_text.dart';

class RegistrationScreen extends StatelessWidget {
  final void Function() logIn;

  const RegistrationScreen(this.logIn, {super.key});

  @override
  Widget build(context) {
    final TextEditingController firstnameController = TextEditingController();
    final TextEditingController secondnameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController enterpasswordController =
        TextEditingController();
    return Container(
      width: double.infinity,
      height: 500,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        // gradient: LinearGradient(
        //     colors: [Color.fromARGB(149, 187, 178, 141), Colors.white],
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
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
                  onTap: logIn,
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
              const CustomButton(
                label: 'Create Account ',
                buttonColor: Colors.lime,
              )
            ],
          ),
        ),
      ),
    );
  }
}
