import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/widgets/customer_sale.dart';
import 'package:get/get.dart';
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
          _showSuccessNotification();
          salesDataList.add(CustomerSale(
            title: "Customer: $user_email",
            icon: Icons.delete,
            bgColor: Colors.lime,
            iconColor: Colors.red,
            value: "Amount: Ksh $amount",
            onPressed: () {
              deleteCustomerSale(user_email);
            },
          ));
        } else {
          print("Failed to add sale");
        }
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> deleteCustomerSale(String user_email) async {
    try {
      http.Response response = await http.post(
        Uri.parse(
            "https://nzembi.tech/mercy_cereal_shop/ordersTable/deleteOrder.php?user_email=$user_email"),
        body: {
          "user_email": user_email,
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['success'] == 1) {
          print("Sale deleted successfully");
        } else {
          print("Failed to delete sale");
        }
      }

      salesDataList
          .removeWhere((sale) => sale.title == "Customer: $user_email");
    } catch (e) {
      print("Error: $e");
    }
  }

  void _showSuccessNotification() {
    showDialog(
      context: Get.overlayContext!,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sale Added'),
          content: const Text('Sale has been added successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
