import 'package:flutter/foundation.dart';

class Product {
  String name;
  int price;
  Product({
   required this.name, 
   required this.price,
  });
}

class Catalog extends ChangeNotifier{
  final List<Product> _products = [
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
  ];
  List<int> _cart = [];

  List<Product> get Products => _products;
  List<int> get Cart => _cart;
  int get numOfCartEmpty => _cart.length;
  int get moneyBuyProducts => _cart.fold(0, (previousValue, element) => previousValue + _products[element].price);

  void addToCart(int index) {
    if(CheckIsEmptyProduct(index) == true) return;
    _cart.add(index);
    notifyListeners();
  }
  void delProductCart(int index) {
    _cart.remove(index);
    notifyListeners();
  }
  bool CheckIsEmptyProduct(int index) {
    for (int i in _cart) {
      if (i == index) {
        return true;
      }
    }
    return false;
  }
}