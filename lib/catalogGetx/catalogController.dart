import 'package:flutter_ngoctruong/catalogProvider/providerCatalog.dart';
import 'package:get/get.dart';

class CatalogController extends GetxController {
  final _products = <Product>[
    Product(name: "Táo", price: 10000),
    Product(name: "Nho", price: 20000),
    Product(name: "Cam", price: 15000),
    Product(name: "Chanh", price: 5000),
    Product(name: "Kiwi", price: 25000),
    Product(name: "Dưa hấu", price: 30000),
    Product(name: "Dâu tây", price: 40000),
    Product(name: "Chuối", price: 8000),
    Product(name: "Xoài", price: 25000),
    Product(name: "Lê", price: 12000),
    Product(name: "Nectarine", price: 30000),
    Product(name: "Táo đỏ", price: 15000),
    Product(name: "Dưa gang", price: 20000),
    Product(name: "Chôm chôm", price: 50000),
    Product(name: "Mận", price: 18000),
    Product(name: "Hồng xiêm", price: 25000),
    Product(name: "Dừa xiêm", price: 10000),
    Product(name: "Chà là", price: 35000),
    Product(name: "Dừa nước", price: 20000),
    Product(name: "Bưởi", price: 30000),
  ].obs; // khai bao bien RXList Product
  final _cart = <int>[].obs; // Khai bao bien RXInt  Cart
  List<Product> get products => _products.value;
  List<int> get cart => _cart.value;
  int get numOfCartEmpty => _cart.value.length;
  int get moneyBuyProducts => _cart.fold(0, (previousValue, element) => previousValue + _products[element].price);

  void addToCart(int index) {
    cart.add(index);
    _cart.refresh();
    _products.refresh();
  }
  void delProductCart(int index) {
    cart.removeAt(index);
    _cart.refresh();
    _products.refresh();
  }
  bool CheckIsEmptyProduct(int index) {
    for(int i in cart) {
      if (i == index) {
        return true;
      }
    }
    return false;
  }
}
