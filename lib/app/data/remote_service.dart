import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../features/home/model/product.dart';

class RemoteServices {
  final String productUrl = "https://api.escuelajs.co/api/v1/products";

  // Approch - 1 (Preferable)
  // without declaring extra "ProductList = <productModel>[]"
  // For this approach response must have to be " jsonDecoded(respons.body) ".
  Future<Either<String, List<ProductModel>>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(productUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        final productList = data.map((e) => ProductModel.fromJson(e)).toList();
        return Right(productList);
      } else {
        return const Left("No data fetched");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

// // Approach 2 - Declaring extra List on Top.
//   Future<Either<String, List<ProductModel>>> fetchProducts2() async {
//     final productList2 = <ProductModel>[];
//     try {
//       final response = await http.get(Uri.parse(productUrl));
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         for (var i in data) {
//           productList2.add(ProductModel.fromJson(i));
//         }

//         return Right(productList2);
//       } else {
//         return const Left("No data fetched");
//       }
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }
}
