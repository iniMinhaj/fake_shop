import 'package:fake_shop/app/features/cart/model/cart_model.dart';
import 'package:fake_shop/app/features/home/model/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final items = <CartModel>[].obs;

  void addItem(ProductModel product) {
    for (var item in items) {
      if (item.productModel.id == product.id) {
        item.quantity.value++;

        return;
      }
    }
    items.add(
      CartModel(productModel: product),
    );
  }

  void removeItemFromCart(CartModel cartItem) {
    items.remove(cartItem);
  }

  void incrementItem(CartModel cartItem) {
    cartItem.quantity.value++;
  }

  void decrementItem(CartModel cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity.value--;
    } else {
      items.remove(cartItem);
    }
  }

  double get totalAmount => items.fold(
      0.0,
      (sum, cartItem) =>
          sum + (cartItem.productModel.price! * cartItem.quantity.value));

  int get totalItems {
    return items.fold(0, (sum, item) => sum + item.quantity.value);
  }
}


/// .................. Approach 2 (working) (but we have to GetBuilder)

// class CartController extends GetxController {
//   final items = <CartModel>[].obs;

//   void addItem(ProductModel product) {
//     for (var item in items) {
//       if (item.productModel.id == product.id) {
//         item.quantity++;
//         update(); // Notify observers about the change
//         return;
//       }
//     }
//     items.add(
//       CartModel(productModel: product),
//     );
//     update(); // Notify observers about the change
//   }

//   void incrementItem(CartModel cartItem) {
//     cartItem.quantity++;
//     update(); // Notify observers about the change
//   }

//   void decrementItem(CartModel cartItem) {
//     if (cartItem.quantity > 1) {
//       cartItem.quantity--;
//       update(); // Notify observers about the change
//     } else {
//       items.remove(cartItem);
//       update(); // Notify observers about the change
//     }
//   }

//   int get totalItems {
//     return items.fold(0, (sum, item) => sum + item.quantity);
//   }

//   // double get totalPrice {
//   //   return items.fold(
//   //       0, (sum, item) => sum + (item.quantity * item.productModel.price!));
//   // }

//   double get totalPrice {
//     // Calculate the total price based on the updated quantities
//     double totalPrice = 0.0;

//     for (var item in items) {
//       totalPrice += item.quantity * item.productModel.price!;
//     }
//     return totalPrice;
//   }
// }





//// ..................... Approach 1 ......................

// import 'package:fake_shop/app/features/cart/model/cart_model.dart';
// import 'package:fake_shop/app/features/home/model/product.dart';
// import 'package:get/get.dart';

// class CartController extends GetxController {
//   final items = <CartModel>[].obs;
//   final quantity = 1.obs;
//   void addItem(ProductModel product) {
//     for (var item in items) {
//       if (item.productModel.id == product.id) {
//         item.quantity++;

//         return;
//       }
//     }
//     items.add(
//       CartModel(productModel: product),
//     );
//   }

//   void incrementItem(CartModel cartItem) {
//     cartItem.quantity++;
//   }

//   void decrementItem(CartModel cartItem) {
//     if (cartItem.quantity > 1) {
//       cartItem.quantity--;

//       print(quantity.value);
//     } else {
//       items.remove(cartItem);
//     }
//   }

//   int get totalItems {
//     return items.fold(0, (sum, item) => sum + item.quantity);
//   }

//   double get totalPrice {
//     return items.fold(
//         0, (sum, item) => sum + (item.quantity * item.productModel.price!));
//   }
// }
