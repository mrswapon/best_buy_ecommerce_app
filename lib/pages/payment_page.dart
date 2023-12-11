import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Payment extends StatefulWidget {
  const Payment({
    Key? key,
    required this.price,
  }) : super(key: key);

  final num price;

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String selectedPaymentOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Make Payment',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "${widget.price}",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            buildPaymentOption('bkash', 'assets/bkash_logo.png'),
            const SizedBox(
              height: 10,
            ),
            buildPaymentOption('Nagad', 'assets/nagad_logo.png'),
            const SizedBox(
              height: 10,
            ),
            buildPaymentOption('Stripe', 'assets/stripe_logo.png'),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                child: Text('Payment'),
                onPressed: () {
                  if (selectedPaymentOption.isNotEmpty) {
                    Get.snackbar(
                      'Payment',
                      'This payment is successful using $selectedPaymentOption.',
                    );
                    // Perform further actions based on the selected payment option
                  } else {
                    Get.snackbar('Error', 'Please select a payment option.');
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildPaymentOption(String name, String imagePath) {
    return Row(
      children: [
        Radio(
          value: name,
          groupValue: selectedPaymentOption,
          onChanged: (String? value) {
            setState(() {
              selectedPaymentOption = value ?? '';
            });
          },
        ),
        const SizedBox(
          width: 10,
        ),
        Image.asset(
          imagePath,
          width: 50,
          height: 50,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(name),
      ],
    );
  }
}
