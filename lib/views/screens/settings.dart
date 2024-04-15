import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/constants.dart';
import 'package:flutter_application_1/views/widgets/setting_item.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            color: appBlackColor,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        leadingWidth: 50,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingItem(
                title: "Language",
                icon: Icons.language,
                bgColor: Colors.orange.shade100,
                iconColor: Colors.orange,
                value: "English",
                onTap: () {
                  _showSnackbar(context, "Language");
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Dark Mode",
                icon: Icons.dark_mode,
                bgColor: Colors.grey.shade100,
                iconColor: Colors.grey,
                value: "Off",
                onTap: () {
                  _showSnackbar(context, "Dark Mode");
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Notifications",
                icon: Icons.notifications,
                bgColor: Colors.blue.shade100,
                iconColor: Colors.blue,
                value: "On",
                onTap: () {
                  _showSnackbar(context, "Notifications");
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Privacy",
                icon: Icons.privacy_tip,
                bgColor: Colors.green.shade100,
                iconColor: Colors.green,
                value: "Public",
                onTap: () {
                  _showSnackbar(context, "Privacy");
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Help",
                icon: Icons.help_outline,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                value: "more info",
                onTap: () {
                  _showSnackbar(context, "Help");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackbar(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 8),
            Text("$title has not been implemented yet",
                style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
