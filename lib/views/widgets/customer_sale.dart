import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/constants.dart';

class CustomerSale extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final String value;

  const CustomerSale({
    super.key,
    required this.title,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.grey.shade200,
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: appBlackColor, fontSize: 20),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(color: appBlackColor, fontSize: 20),
        ),
        trailing: const Icon(Icons.delete, color: Colors.red),
        tileColor: Colors.white,
      ),
    );
  }
}
