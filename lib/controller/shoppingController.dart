import 'package:get/get.dart';
import 'package:getx_1st/model/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));

    var productResult = [
      Product(
          id: 1,
          price: 30,
          productDescription: ' Some description about product',
          productImage: 'abd',
          productName: 'FirstProd'),
      Product(
          id: 2,
          price: 90,
          productDescription: ' Some description about product',
          productImage: 'abcd',
          productName: 'SecondProd'),
      Product(
          id: 3,
          price: 60,
          productDescription: ' Some description about product',
          productImage: 'abcde',
          productName: 'ThirdProd')
    ];
    products.value = productResult;
  }
}
