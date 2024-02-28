import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/constants.dart';

class SettingItem extends StatelessWidget {
  final String title;  
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final String value;
  final Function onTap;

  const SettingItem({
    super.key,
    required this.title,    
    required this.icon,
    required this.bgColor,
    required this.iconColor,
    this.value = "",
    required this.onTap,
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
        ),
        subtitle: Text(value),
        leading: Icon(icon, color: iconColor),
        trailing: const Icon(Icons.arrow_forward, color: appBlackColor),
        tileColor: Colors.white,
        onTap: () {
          onTap();
        },
      ),
    );
  }
}
