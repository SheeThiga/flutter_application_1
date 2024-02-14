import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/widgets/custom_button.dart';
import 'package:flutter_application_1/views/widgets/custom_field.dart';
import 'package:flutter_application_1/views/widgets/custom_text.dart';
import 'package:get/get.dart';


class Calculator extends StatelessWidget {
  
  final TextEditingController num1controller = TextEditingController();
  final TextEditingController num2controller = TextEditingController();
  double sum = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            controller: num1controller,
            hintMessage: 'num1',
            hintStyle: const TextStyle(color: Colors.black),
          ),
          CustomTextField(
            controller: num2controller,
            hintMessage: 'num2',
            hintStyle: const TextStyle(color: Colors.black),
          ),
          // const CustomButton(label: 'Sum',),
          ElevatedButton(
            onPressed: () {
              double a = double.parse(num1controller.text);
              double b = double.parse(num2controller.text);
              sum = a + b;
              print("sum is: $sum");
            },
            child: const Text("calculate"),
          ),

          Obx(() => 
             CustomText(
                label: 'Sum is: $sum', labelColor: Colors.black, fontSize: 20.0),
          ),
        ],
      ),
    ));
  }
}
