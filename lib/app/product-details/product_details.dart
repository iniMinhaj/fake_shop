import 'package:fake_shop/app/features/cart/controller/cart_controller.dart';
import 'package:fake_shop/app/features/cart/model/cart_model.dart';
import 'package:fake_shop/app/features/home/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
          SizedBox(
            height: 300,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: product.images!.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    product.images![1],
                    height: 280,
                    width: 400,
                  );
                }),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                  onPressed: () {
                    cartController
                        .decrementItem(CartModel(productModel: product));
                  },
                  child: const Icon(Icons.remove)),
              Text("", style: GoogleFonts.roboto(fontSize: 20)),
              FloatingActionButton(
                  onPressed: () {
                    cartController
                        .incrementItem(CartModel(productModel: product));
                  },
                  child: const Icon(Icons.add)),
            ],
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () {
              cartController.addItem(product);
              Get.back();
              Get.snackbar("Cart Item", "Product added",
                  backgroundColor: Colors.red);
            },
            child: Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                  child: Text(
                "Add To Cart",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              )),
            ),
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       cartController.addItem(product);
          //     },
          //     child: const Text("Add to cart"))
        ],
      ),
    );
  }
}
