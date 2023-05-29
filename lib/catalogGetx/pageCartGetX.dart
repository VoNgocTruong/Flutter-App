import 'package:flutter/material.dart';
import 'package:flutter_ngoctruong/catalogGetx/catalogController.dart';
import 'package:get/get.dart';
class pageCartGetX extends StatelessWidget {
  const pageCartGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: GetX<CatalogController>(
        init: Get.find<CatalogController>(),
        builder: (controller) {
          final cart = controller.cart;
          final products = controller.products;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("${index + 1}. ",style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(products[cart[index]].name, style: TextStyle(fontWeight: FontWeight.bold),),
                            Spacer(),
                            Row(
                              children: [
                                Text("${products[cart[index]].price.toString()}đ"),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed:() {
                                    controller.delProductCart(index);
                                    const snackBar = SnackBar(
                                      content: Text('Đã xoá mặt hàng'),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(15),
                color: Colors.grey[350],
                child: Row(
                  children: [
                    Spacer(),
                    const Text("Tổng tiền: ", style: TextStyle(fontSize: 20),),
                    Text(
                      "${controller.moneyBuyProducts}đ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
