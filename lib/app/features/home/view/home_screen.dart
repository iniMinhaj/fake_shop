import 'package:fake_shop/app/features/cart/controller/cart_controller.dart';
import 'package:fake_shop/app/features/cart/views/add_to_cart_screen.dart';
import 'package:fake_shop/app/features/home/controller/product_controller.dart';
import 'package:fake_shop/app/product-details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    final cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Faky Shop",
          style: GoogleFonts.francoisOne(fontSize: 40.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Obx(
              () {
                return Expanded(
                  child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              crossAxisCount: 2,
                              childAspectRatio: 0.85),
                      itemCount: productController.productList.length,
                      itemBuilder: (context, index) {
                        final product = productController.productList;
                        return InkWell(
                          onTap: () {
                            Get.to(
                                () => ProductDetails(product: product[index]));
                          },
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100.h,
                                  child:
                                      Image.network(product[index].images![1]),
                                ),
                                Text(
                                  product[index].title.toString(),
                                  style: GoogleFonts.aBeeZee(fontSize: 14.sp),
                                  maxLines: 2,
                                ),
                                Text("${product[index].price}\$",
                                    style:
                                        GoogleFonts.aBeeZee(fontSize: 12.sp)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RatingBarIndicator(
                                      itemSize: 12.h,
                                      rating: 5,
                                      itemBuilder: (context, index) {
                                        return const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        );
                                      },
                                    ),
                                    SizedBox(width: 10.w),
                                    const Text("5"

                                        // "(${product[index].rating!.rate.toString()})"

                                        ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                InkWell(
                                  borderRadius: BorderRadius.circular(50.r),
                                  onTap: () {
                                    cartController.addItem(product[index]);
                                  },
                                  child: Ink(
                                    height: 20.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(50.r)),
                                    child: Center(
                                        child: Text(
                                      "Add",
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: 12.sp, color: Colors.white),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Obx(() {
        return FloatingActionButton.extended(
          label: Text(
            "X ${cartController.totalItems}",
            style: GoogleFonts.aBeeZee(fontSize: 24.sp, color: Colors.white),
          ),
          backgroundColor: Colors.red,
          onPressed: () {
            Get.to(() => const AddToCartScreen(),
                transition: Transition.cupertino);
          },
          icon: const Icon(
            Icons.shopping_bag,
            color: Colors.white,
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
