import 'package:best_buy/controller/log_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_up_page.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  LogInController logInController = Get.put(LogInController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Login Now",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      label: const Text("Enter you email"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13))),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      label: const Text("Enter you password"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13))),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    _logIn();
                  },
                  minWidth: double.infinity,
                  height: 60,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    'LogIn',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("You don't have an acount?"),
                    TextButton(
                      onPressed: () {
                        Get.to(SignUpPage());
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _logIn() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    logInController.login(email, password);
  }
}
