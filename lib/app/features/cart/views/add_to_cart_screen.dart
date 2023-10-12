import 'package:fake_shop/app/features/cart/controller/cart_controller.dart';
import 'package:fake_shop/app/features/cart/views/truncate_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToCartScreen extends StatelessWidget {
  const AddToCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Items"),
      ),
      body: Column(
        children: [
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              itemCount: cartController.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Image.network(
                        cartController.items[index].productModel.images![1]),
                  ),
                  title: Text(
                    truncateText(
                        cartController.items[index].productModel.title!, 2),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          cartController
                              .decrementItem(cartController.items[index]);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Icon(Icons.remove,
                              size: 20.h, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Obx(
                        () => Text(
                            cartController.items[index].quantity.value
                                .toString(),
                            style: GoogleFonts.roboto(fontSize: 20.sp)),
                      ),
                      SizedBox(width: 4.w),
                      InkWell(
                        onTap: () {
                          cartController
                              .incrementItem(cartController.items[index]);
                        },
                        child: Container(
                          height: 20.h,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child:
                              Icon(Icons.add, size: 20.h, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            height: 60,
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  return Text(
                    "Total Price = ${cartController.totalAmount} Tk",
                    style: GoogleFonts.roboto(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  );
                })
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
