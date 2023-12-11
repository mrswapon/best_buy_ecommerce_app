import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());
  static String routeName = '/profile';

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileData = profileController.profile;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              CircleAvatar(
                  radius: 100,
                  child: Image.network(
                      "https://demo.alorferi.com${profileData['url']}")),
              const SizedBox(height: 10),
              Text(
                "${profileData['name']}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              Text(
                "${profileData['email']}",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
