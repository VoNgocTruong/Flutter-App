import 'package:flutter/material.dart';
import 'catalogController.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_ngoctruong/catalogGetx/pageCartGetX.dart';
class pageCatalogGetX extends StatelessWidget {
  pageCatalogGetX({Key? key}) : super(key: key);
  CatalogController controller = Get.put(CatalogController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog GetX"),
        actions: [
          Obx(() => GestureDetector(
            onTap: () {
              Get.to(pageCartGetX());
            },
            child: badges.Badge(
              showBadge: controller.numOfCartEmpty > 0,
              badgeContent: Text(
                  "${controller.numOfCartEmpty}"
              ),
              child: Icon(
                Icons.shopping_cart,
                size: 50,
              ),
              position: badges.BadgePosition.topEnd(top: -3,end: 2),
            ),
          ))
        ],
      ),
    body: GetX<CatalogController>(
      init: controller,
      builder: (controller) {
        var list = controller.products;
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => Container(
            color: index % 2 == 0 ? Colors.lightBlueAccent : Colors.white,
            child: ListTile(
                title: Text("${list[index].name}"),
                subtitle: Text("${list[index].price}"),
                leading: Text("${index + 1}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                trailing: controller.CheckIsEmptyProduct(index) == true ? Icon(Icons.check):
                IconButton(
                    onPressed: () {
                      controller.addToCart(index);
                    },
                    icon: Icon(Icons.add))
            ),
          ),
        );
      },
    ),
    );
  }
}
