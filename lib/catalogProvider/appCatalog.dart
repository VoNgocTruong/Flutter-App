import 'package:flutter/material.dart';
import 'package:flutter_ngoctruong/catalogProvider/pageCart.dart';
import 'package:flutter_ngoctruong/catalogProvider/providerCatalog.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
class appCatalog extends StatelessWidget {
  const appCatalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Catalog(),
      lazy: true,
      child: const MaterialApp(
        home: pageCatalog(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class pageCatalog extends StatelessWidget {
  const pageCatalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
        actions: [
          Consumer<Catalog>(builder: (context, value, child) =>
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const pageCart(),)
                );
              },
              child: badges.Badge(
                showBadge: value.numOfCartEmpty > 0,
                badgeContent: Text(
                  "${value.numOfCartEmpty}"
                ),
                child: Icon(
                  Icons.shopping_cart,
                  size: 50,
                ),
                position: badges.BadgePosition.topEnd(top: -3,end: 2),
              ),
            ),
            ),
        ],
      ),
      body: Consumer<Catalog>(
        builder: (context, value, child) {
          var list = value.Products;
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) => Container(
                color: index % 2 == 0 ? Colors.lightBlueAccent : Colors.white,
                child: ListTile(
                  title: Text("${list[index].name}"),
                  subtitle: Text("${list[index].price}"),
                  leading: Text("${index + 1}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  trailing: value.CheckIsEmptyProduct(index) == true ? Icon(Icons.check):
                  IconButton(
                      onPressed: () {
                        value.addToCart(index);
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
