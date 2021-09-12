import 'package:get/get.dart';
import 'package:getx_1st/model/product.dart';

class CartController extends GetxController {
  var cartiTems = <Product>[].obs;
  int get itemCounts => cartiTems.length;
  double get totalPrice => cartiTems.fold(0, (sum, item) => sum + item.price);

  addToCart(Product product) {
    cartiTems.add(product);
  }
}
