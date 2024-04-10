import 'package:flutter_application_1/controllers/sales_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/constants.dart';
import 'package:flutter_application_1/views/widgets/customer_sale.dart';
import 'package:get/get.dart';

class SalesScreen extends StatelessWidget {
  SalesScreen({super.key});

  final SalesController salesController = Get.put(SalesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Customer Sales",
          style: TextStyle(
            color: appBlackColor,
          ),
        ),
        leadingWidth: 50,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomerSale(
                    title: "Customer: doe@gmail.com",
                    icon: Icons.delete,
                    bgColor: Colors.lime,
                    iconColor: Colors.red,
                    value: "Amount: 200",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomerSale(
                    title: "Customer: maggy@gmail.com",
                    icon: Icons.delete,
                    bgColor: Colors.lime,
                    iconColor: Colors.red,
                    value: "Amount: 200",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomerSale(
                    title: "Customer: cherry@gmail.com",
                    icon: Icons.delete,
                    bgColor: Colors.lime,
                    iconColor: Colors.red,
                    value: "Amount: 200",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  for (var saleData in salesController.salesDataList)
                    CustomerSale(
                      title: saleData.title,
                      icon: saleData.icon,
                      bgColor: saleData.bgColor,
                      iconColor: saleData.iconColor,
                      value: saleData.value,
                    ),
                  const SizedBox(height: 20),
                ],
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddCustomerSaleDialog(context);
        },
        backgroundColor: primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddCustomerSaleDialog(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController productIdController = TextEditingController();
    TextEditingController amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add Customer Sale"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: "Enter Email"),
              ),
              TextField(
                controller: productIdController,
                decoration: const InputDecoration(hintText: "Enter Product ID"),
              ),
              TextField(
                controller: amountController,
                decoration: const InputDecoration(hintText: "Enter Amount"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.green),
              ),
            ),
            TextButton(
              onPressed: () {
                salesController.addCustomerSale(
                  emailController.text,
                  productIdController.text,
                  amountController.text,
                );
                Navigator.of(context).pop();
              },
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }
}
