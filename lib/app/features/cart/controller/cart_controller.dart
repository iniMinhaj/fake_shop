import 'package:fake_shop/app/features/cart/model/cart_model.dart';
import 'package:fake_shop/app/features/home/model/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final items = <CartModel>[].obs;
//Working..............
  void addItem(ProductModel product) {
    for (var item in items) {
      if (item.productModel.id == product.id) {
        item.quantity++;
        return;
      }
    }
    items.add(CartModel(productModel: product));
  }
// End....................

  void incrementItem(CartModel cartItem) {
    cartItem.quantity++;
  }

  void decrementItem(CartModel cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
    } else {
      items.remove(cartItem);
    }
  }

  int get totalItems {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }

  double get totalPrice {
    return items.fold(
        0, (sum, item) => sum + (item.quantity * item.productModel.price!));
  }
}
