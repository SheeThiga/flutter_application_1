import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/calculator_controller.dart';
import 'package:flutter_application_1/views/widgets/custom_field.dart';
import 'package:flutter_application_1/views/widgets/custom_text.dart';
import 'package:get/get.dart';

final TextEditingController num1controller = TextEditingController();
final TextEditingController num2controller = TextEditingController();
final CalculatorController calculatorController =
    Get.put(CalculatorController());

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding:
              const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
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

                  double s = a + b;
                  calculatorController.updateSum(a, b, s);
                },
                child: const Text("calculate"),
              ),

              Obx(
                () => CustomText(
                    label:
                        'The Sum of ${calculatorController.num1} and ${calculatorController.num2} is: ${calculatorController.sum}',
                    labelColor: Colors.black,
                    fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
