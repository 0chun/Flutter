import 'package:get/get.dart';
import 'package:getx_test_shop/data/services.dart';
import 'package:getx_test_shop/model/product_model.dart';

class Controller extends GetxController {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    var products = await Services.fetchProducts();
    if (products != null) {
      productList.value = products;
    }
  }
}
