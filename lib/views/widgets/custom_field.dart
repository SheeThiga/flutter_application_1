import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintMessage;
  final bool hideText;
  final IconData? icon;
  final bool isPassword;
  final TextStyle hintStyle;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintMessage,
    this.icon,
    this.hideText = false,
    this.isPassword = false,
    this.hintStyle = const TextStyle(color: Colors.white),
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintMessage,
          prefixIcon: Icon(icon),
          prefixIconColor: Colors.white,
          hintStyle: hintStyle,
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        obscureText: hideText,
      ),
    );
  }
}
