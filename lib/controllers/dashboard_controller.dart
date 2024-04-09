import 'package:get/get.dart';

class DashboardController extends GetxController {
  final productList = [].obs;
  final loadingProductData = true.obs;

  updateProductList(list) {
    productList.value = list;
  }

  updateLoadingProductData(loading) {
    loadingProductData.value = loading;
  }
}
