import 'package:best_buy/pages/profile_page.dart';
import 'package:best_buy/token_shareprefe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/add_to_card_controller.dart';
import '../controller/profile_controller.dart';
import 'add_to_card_page.dart';
import 'log_in_page.dart';
import 'my_pruduct_page.dart';
import 'all_product_page.dart';
import 'seller_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AddToCartController addToCartController = Get.put(AddToCartController());
  late TabController _tabController;

  @override
  void initState() {
    addToCartController.cartItems;
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        title: const Text(
          "Best Buy",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            icon: Badge(
                label:
                    Obx(() => Text("${addToCartController.cartItems.length}")),
                child: const Icon(
                  Icons.shopping_cart,
                )),
            onPressed: () {
              Get.to(() => AddToCartPage());

              ///AddToCartProductPage());
            },
          ),
        ],
      ),
      bottomNavigationBar: Material(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        color: Colors.blue,
        child: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.production_quantity_limits_outlined),
              text: "My Product",
            ),
            Tab(
              icon: Icon(Icons.people),
              text: "Sellers",
            ),
            Tab(
              icon: Icon(Icons.person),
              text: "Profile",
            )
          ],
        ),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.blueGrey),
          child: TabBarView(controller: _tabController, children: [
            Container(
                height: 200,
                width: 200,
                color: Colors.yellow,
                child: AllProductPage()),
            Container(
                height: 200,
                width: 200,
                color: Colors.red,
                child: MyProductPage()),
            Container(
                height: 200,
                width: 200,
                color: Colors.purple,
                child: SellerPage()),

            /// profile
            Container(
                height: 200,
                width: 200,
                color: Colors.purple,
                child: ProfilePage()),
          ])),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                padding: const EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(color: Colors.blue),
                  accountName: const Text('Mr. Swapon'),
                  accountEmail: const Text('swaponbro@gmail.com'),
                  onDetailsPressed: () {
                    Get.back();
                  },
                  currentAccountPicture: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/4/4f/Dash%2C_the_mascot_of_the_Dart_programming_language.png"),
                )),
            ListTile(
              onTap: () {
                Get.to(MyProductPage());
              },
              title: const Text('My Product'),
              leading: const Icon(Icons.production_quantity_limits_outlined),
            ),
            ListTile(
              onTap: () {
                Get.to(SellerPage());
              },
              title: const Text('All Seller'),
              leading: Icon(Icons.people),
            ),
            ListTile(
              onTap: () {
                Get.to(AllProductPage());
              },
              title: const Text('All Products'),
              leading: const Icon(Icons.align_horizontal_left),
            ),
            ListTile(
              onTap: () {
                Get.to(AllProductPage());
              },
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
            ),
            ListTile(
              onTap: () {
                Get.changeTheme(ThemeData.light());
              },
              title: const Text('Light Mood'),
              leading: const Icon(Icons.light_mode),
            ),
            ListTile(
              onTap: () {
                Get.changeTheme(ThemeData.dark());
              },
              title: const Text('Dark Mood'),
              leading: const Icon(Icons.dark_mode),
            ),
            const SizedBox(
              height: 180,
            ),
            ListTile(
              onTap: () {
                TokenSharePrefences.loadToken();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LogInPage()));
              },
              title: const Text('Log Out'),
              leading: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
