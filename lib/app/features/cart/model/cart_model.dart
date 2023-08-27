// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fake_shop/app/features/home/model/product.dart';

class CartModel {
  final ProductModel productModel;
  int quantity;

  CartModel({
    required this.productModel,
    this.quantity = 1,
  });
}
