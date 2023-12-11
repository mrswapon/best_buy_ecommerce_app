import 'package:best_buy/controller/log_in_controller.dart';
import 'package:best_buy/pages/welcome_page.dart';
import 'package:best_buy/token_shareprefe.dart';
import 'package:best_buy/pages/welcome_page.dart';
import 'package:best_buy/token_shareprefe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/home_page.dart';
import 'pages/log_in_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  LogInController logInController = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        // Using a ternary operator to conditionally choose the initial page
        home: FutureBuilder(
          future: TokenSharePrefences.loadToken(),
          builder: (context, snapshot) {
            return WelcomePage();
          },
        ));
  }
}
