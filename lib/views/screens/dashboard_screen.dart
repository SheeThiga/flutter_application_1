import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/constants.dart';
import 'package:flutter_application_1/controllers/dashboard_controller.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/views/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

DashboardController productController = Get.put(DashboardController());

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(context) {
    productController.updateLoadingProductData(true);
    getProducts().then((value) {
      productController.updateProductList(value);
      productController.updateLoadingProductData(false);
    });

    Future<String> _getUserFirstName() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? firstName = prefs.getString('firstname') ?? '';
      return firstName;
    }

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: appBlackColor, size: 30.0),
        // title: const CustomText(
        //   label: 'Hi Leo!',
        //   labelColor: appBlackColor,
        //   fontSize: 30.0,
        // ),
        title: FutureBuilder<String>(
          future: _getUserFirstName(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Hi, Loading...');
            } else if (snapshot.hasError) {
              return const Text('Hi User!');
            } else {
              return CustomText(
                label: 'Hi ${snapshot.data}!',
                labelColor: appBlackColor,
                fontSize: 30.0,
              );
            }
          },
        ),

        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Notifications"),
                    content: const Text("No notifications!",
                        style: TextStyle(color: Colors.red)),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Close',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () async {
              await Get.offAllNamed('/login');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 15.0),
          Text(
            'Sales: 5,000',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: appBlackColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add_circle_outline_outlined,
                  color: appBlackColor),
              const SizedBox(
                width: 5,
              ),
              Text(
                'profits: 500/=',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: appBlackColor,
                    ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Today',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: appWhiteColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(width: 5),
              const Icon(Icons.calendar_month_sharp, color: appWhiteColor),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_box_outlined, color: appBlackColor),
                style: ElevatedButton.styleFrom(
                  backgroundColor: appWhiteColor,
                  foregroundColor: appBlackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                label: const Text('Grains'),
              ),
              const SizedBox(width: 20.0),
              ElevatedButton.icon(
                onPressed: () => Get.toNamed("/calculator"),
                icon:
                    const Icon(Icons.calculate_outlined, color: appBlackColor),
                style: ElevatedButton.styleFrom(
                  backgroundColor: appWhiteColor,
                  foregroundColor: appBlackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                label: const Text('Calculator'),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(
            () => Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                decoration: const BoxDecoration(
                  color: appGreyColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: productController.loadingProductData.value
                    ? const Center(child: Text('Loading'))
                    : GridView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 30.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: productController.productList.length,
                        itemBuilder: (context, index) {
                          return Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: appWhiteColor),
                              child: ListTile(
                                title: Text(
                                  '${productController.productList[index]?.product_name}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: appBlackColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Price: ${productController.productList[index]?.price}/kg'),
                                    Image.network(
                                      "https://nzembi.tech/mercy_cereal_shop/productTable/productImages/${productController.productList[index]?.product_image}",
                                      height: 50,
                                      width: 50,
                                    )
                                  ],
                                ),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(productController
                                            .productList[index]?.product_name),
                                        content: Column(
                                          children: [
                                            Image.network(
                                              "https://nzembi.tech/mercy_cereal_shop/productTable/productImages/${productController.productList[index]?.product_image}",
                                            ),
                                            const SizedBox(
                                              height: 50,
                                            ),
                                            Text(
                                                'Quantity_sold: ${productController.productList[index]?.quantity_sold}kgs'),
                                            const SizedBox(
                                              height: 50,
                                            ),
                                            Text(
                                                'Quantity_remaining: ${productController.productList[index]?.quantity_remaining}kgs'),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Close',
                                              style: TextStyle(
                                                  color: Colors.green),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<ProductModel>> getProducts() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://nzembi.tech/mercy_cereal_shop/productTable/getProducts.php'));

      if (response.statusCode == 200) {
        var serverResponse = json.decode(response.body);
        List<Map<String, dynamic>> productResponse =
            serverResponse['products'].cast<Map<String, dynamic>>();

        // Removed the unnecessary cast
        List<ProductModel> productList = productResponse.map((products) {
          return ProductModel.fromJson(products);
        }).toList();

        return productList;
      }

      throw Exception("Failed to load products");
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
