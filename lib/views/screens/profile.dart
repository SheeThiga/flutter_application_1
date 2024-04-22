import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/constants.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              const SizedBox(height: 20),
              itemProfile('First Name', 'Name', Icons.person, nameController),
              const SizedBox(height: 10),
              itemProfile('Contact', '0', Icons.phone, contactController),
              const SizedBox(height: 10),
              itemProfile('Location', 'City', Icons.place, locationController),
              const SizedBox(height: 10),
              itemProfile('Email', 'mail', Icons.mail, emailController),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _showUpdateProfileDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: appBlackColor,
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text('Edit Profile'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget itemProfile(String title, String subtitle, IconData iconData,
      TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: primaryColor.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: subtitle, // Display subtitle as the hint text
          ),
        ),
        subtitle: Text(title), // Display title as the subtitle
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }

  void _showUpdateProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Profile'),
          content: const Text('Are you sure you want to update your profile?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                updateProfile(context);
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  Future<void> updateProfile(BuildContext context) async {
    String firstname = nameController.text;
    String user_contact = contactController.text;
    String user_location = locationController.text;
    String user_email = emailController.text;

    try {
      http.Response response = await http.post(
        Uri.parse(
            "https://nzembi.tech/mercy_cereal_shop/userTable/updateUser.php"),
        body: {
          "firstname": firstname,
          "user_contact": user_contact,
          "user_location": user_location,
          "user_email": user_email,
        },
        headers: {
          "content-type": "application/x-www-form-urlencoded",
        },
      );

      if (response.statusCode == 200) {
        var serverResponse = json.decode(response.body);
        int updated = serverResponse['success'];
        if (updated == 1) {
          print("Profile updated successfully");
        } else {
          print("Failed to update profile");
        }
      } else {
        print("Failed to update profile: ${response.statusCode}");
      }
    } catch (e) {
      print("Error updating profile: $e");
    }
  }
}
