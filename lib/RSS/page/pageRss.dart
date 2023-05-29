import 'package:flutter/material.dart';
import 'package:flutter_ngoctruong/RSS/controller/rssController.dart';
import 'package:flutter_ngoctruong/RSS/page/webview.dart';
import 'package:get/get.dart';
// làm thêm menu chọn nhiều mục báo
class PageRss extends StatelessWidget {
  PageRss({Key? key}) : super(key: key);
  var controller = Get.put(ControllerRss());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(resourceName),
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.readRss(),
        child: GetX<ControllerRss>(
          init: controller,
          builder: (controller) {
            var listRss = controller.rssList;
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: ListView.separated(
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(MyWebPage(url: listRss[index].link?? "",)),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: _getImage(listRss[index].imageUrl),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              flex: 2,
                                child: Text(listRss[index].title?? "", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 25),)
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(listRss[index].description?? "", style: TextStyle(fontSize: 20),)
                    ],
                  ),
                  separatorBuilder: (context, index) => Divider(thickness: 2,),
                  itemCount: listRss.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
Widget _getImage(String? url) {
  if(url!=null)
    return Image.network(url, fit: BoxFit.fitWidth,);
  return Center(
    child: Column(
      children: const [
        Icon(Icons.image),
        Text("No Image!")
      ],
    ),
  );
}

