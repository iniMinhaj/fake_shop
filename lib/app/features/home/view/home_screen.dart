import 'package:fake_shop/app/features/home/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Obx(
        () {
          return ListView.builder(
              itemCount: productController.productList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      productController.productList[index].title.toString()),
                );
              });
        },
      ),
    );
  }
}     //  SizedBox(
            //   height: 500,
            //   child: GridView.builder(
            //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //           mainAxisExtent: 10,
            //           crossAxisSpacing: 10,
            //           crossAxisCount: 2),
            //       itemCount: productController.productList.length,
            //       itemBuilder: (context, index) {
            //         final product = productController.productList;
            //         return Container(
            //           child: Column(
            //             children: [
            //               SizedBox(
            //                   height: 80,
            //                   child: Image.network(
            //                       product[index].image.toString())),
            //               Text(product[index].title.toString()),
            //               Text(product[index].price.toString()),
            //               Text(product[index].rating.toString()),
            //             ],
            //           ),
            //         );
//             //       }),
//             // );
//           })
//         ],
//       ),
//     );
//   }
// }
