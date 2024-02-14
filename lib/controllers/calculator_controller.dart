import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var sum = 0.0.obs;
  updateSum(double newSum) {
    sum.value = newSum;
  }
}
