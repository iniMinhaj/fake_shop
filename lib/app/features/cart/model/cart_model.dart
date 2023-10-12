// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fake_shop/app/features/home/model/product.dart';
import 'package:get/get.dart';

class CartModel {
  final ProductModel productModel;
  final RxInt quantity;

  CartModel({required this.productModel, int quantity = 1})
      : quantity = quantity.obs;
}
