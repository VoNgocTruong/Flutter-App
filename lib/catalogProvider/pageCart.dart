import 'package:flutter/material.dart';
import 'package:flutter_ngoctruong/catalogProvider/providerCatalog.dart';
import 'package:provider/provider.dart';

class pageCart extends StatefulWidget {
  const pageCart({Key? key}) : super(key: key);

  @override
  State<pageCart> createState() => _pageCartState();
}

class _pageCartState extends State<pageCart> {
  @override
  Widget build(BuildContext context) {
    var catalog = context.watch<Catalog>();
    var products = catalog.Products;
    var cart = catalog.Cart;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      Text(products[cart[index]].name, style: TextStyle(fontWeight: FontWeight.bold),),
                      Spacer(),
                      Row(
                        children: [
                          Text(products[cart[index]].price.toString()),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed:() {
                              catalog.delProductCart(index);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Spacer(),
                const Text("Tổng tiền: "),
                Text(
                  "${catalog.moneyBuyProducts}đ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(width: 20)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
