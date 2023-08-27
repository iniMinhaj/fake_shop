import 'package:fake_shop/app/data/remote_service.dart';
import 'package:fake_shop/app/features/home/model/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final isLoading = false.obs;
  final productList = <ProductModel>[].obs;

  Future<void> fetchProducts() async {
    isLoading(true);
    final data = await RemoteServices().fetchProducts();
    isLoading(false);
    data.fold((error) => Get.snackbar("", error.toString()), (products) {
      productList.value = products;
      print(products.toString());
    });
  }

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }
}
