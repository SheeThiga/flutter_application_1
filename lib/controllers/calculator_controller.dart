import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var sum = 0.0.obs;
  var num1 = 0.0.obs;
  var num2 = 0.0.obs;

  updateSum(double num1, double num2, double newSum) {
    this.num1.value = num1;
    this.num2.value = num2;
    sum.value = newSum;
  }
}
