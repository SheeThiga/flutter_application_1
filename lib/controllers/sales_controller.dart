import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/widgets/customer_sale.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class SalesController extends GetxController {
  RxList<CustomerSale> salesDataList = <CustomerSale>[].obs;

  Future<void> addCustomerSale(
      String user_email, String product_id, String amount) async {
    try {
      http.Response response = await http.post(
        Uri.parse(
            "https://nzembi.tech/mercy_cereal_shop/ordersTable/createOrder.php"),
        body: {
          "user_email": user_email,
          "product_id": product_id,
          "amount": amount,
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['success'] == 1) {
          print("Sale added successfully");

          // Update salesDataList with the newly added sale
          salesDataList.add(CustomerSale(
            title: "Customer: $user_email",
            icon: Icons.delete,
            bgColor: Colors.lime,
            iconColor: Colors.red,
            value: "Amount: $amount",
          ));
        } else {
          print("Failed to add sale");
          // Optionally, you can show an error message or handle the failure
        }
      }
    } catch (e) {
      print("Error: $e");
      // Optionally, you can show an error message or handle the failure
    }
  }
}