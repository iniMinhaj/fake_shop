import 'package:fake_shop/app/features/cart/model/cart_model.dart';
import 'package:fake_shop/app/features/home/model/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final items = <CartModel>[].obs;

  void addItem(ProductModel product) {
    for (var item in items) {
      if (item.productModel.id == product.id) {
        item.quantity++;
        return;
      }
    }
    items.add(CartModel(productModel: product));
  }

  void incrementItem(ProductModel product) {
    for (var item in items) {
      if (item.productModel.id == product.id) {
        item.quantity++;
        print("Increment: ${item.quantity}");
        return;
      }
    }
  }

  void decrementItem(ProductModel product) {
    for (var item in items) {
      if (item.productModel.id == product.id) {
        if (item.quantity > 1) {
          item.quantity--;
          print("Decrement: ${item.quantity}");
        } else {
          items.remove(item);
        }
        return;
      }
    }
  }

  double get total {
    return items.fold(
        0, (sum, item) => sum + (item.quantity * item.productModel.price!));
  }
}
