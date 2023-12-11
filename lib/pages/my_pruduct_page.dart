import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/my_product_controller.dart';
import 'create_edit_my_product.dart';

class MyProductPage extends StatefulWidget {
  @override
  State<MyProductPage> createState() => _MyProductPageState();
}

class _MyProductPageState extends State<MyProductPage> {
  final MyProductController crudController = MyProductController();
  MyProductController myProductController = Get.put(MyProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Products")),
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => ListView.builder(
          itemCount: myProductController.myProduct.length,
          itemBuilder: (context, index) {
            final product = myProductController.myProduct[index];
            return buildProductTile(product);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToProductPage(
              null); // Passing null for creating a new product
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildProductTile(Map<String, dynamic> product) {
    return ListTile(
      leading: product['url'] == null
          ? Image.network(
              "https://demo.alorferi.com/images/blank_product_picture.png")
          : Image.network("https://demo.alorferi.com${product['url']}"),
      title: Text(product['name']),
      subtitle: Text('Price: \$${product['price']}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              navigateToProductPage(product);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDeleteDialog(context, product);
            },
          ),
        ],
      ),
    );
  }

  void navigateToProductPage(Map<String, dynamic>? product) {
    Get.to(ProductEditPage(product: product))!.then((result) {
      // Handle the result if needed
      if (result != null) {
        // Perform actions based on the result
      }
    });
  }

  void showDeleteDialog(
      BuildContext context, Map<String, dynamic> product) async {
    await Get.defaultDialog(
      title: 'Delete Product',
      content: const Column(
        children: [
          Text("Are you sure you want to delete this product?"),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text('No'),
        ),
        ElevatedButton(
          onPressed: () async {
            await myProductController.deleteProduct(product['id']);
            Get.back();
          },
          child: Text('Yes'),
        ),
      ],
    );
  }
}
