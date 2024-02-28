import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/constants.dart';
import 'package:flutter_application_1/views/widgets/custom_text.dart';
import 'package:flutter_application_1/models/item_dashboard.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(context) {
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
        title: const CustomText(
          label: 'Hi Justus!',
          labelColor: appBlackColor,
          fontSize: 30.0,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 15.0),
          Text(
            'Sales: 50,000',
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
                'profits: 2,500',
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: const BoxDecoration(
                color: appWhiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: gridMap.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: appWhiteColor,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ListTile(
                      title: Text(
                        gridMap[index]['title'],
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: appBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price: ${gridMap[index]['price']}'),
                          Image.asset(
                            gridMap[index]['image'],
                            height: 50,
                          ),
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(gridMap[index]['title']),
                              content: Column(
                                children: [
                                  Image.asset(
                                    gridMap[index]['image'],
                                    height: 200,
                                  ),
                                  Text('Price: ${gridMap[index]['price']}'),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
