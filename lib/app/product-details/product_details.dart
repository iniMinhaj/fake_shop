import 'package:fake_shop/app/features/cart/controller/cart_controller.dart';
import 'package:fake_shop/app/features/home/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details Screen"),
      ),
      body: Column(
        children: [
          Image.network(
            product.image.toString(),
            height: 300,
            width: double.infinity,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                cartController.addItem(product);
              },
              child: const Text("Add to cart"))
        ],
      ),
    );
  }
}
