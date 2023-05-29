import 'package:flutter/material.dart';
import 'package:flutter_ngoctruong/json_basic/jsonData.dart';

class pageListPhoto extends StatelessWidget {
  const pageListPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Json List"),
      ),
      body: FutureBuilder<List<Photo>?>(
        future: getHTTPContent(),
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return const Center(child: Text("Error to load Album"),);
          }
          else if(snapshot.hasData == false) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else {
            List<Photo> list = snapshot.data!;
            return GridView.extent(
              maxCrossAxisExtent: 250,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: List.generate(list.length, (index) => Container(
                decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
                ),
                child: Column(
                  children: [
                    Image.network(list[index].thumbnailUrl!),
                    Text("Id sản phẩm:" + list[index].id!.toString()),
                  ],
                )
              )
              ),
            );
          }
        },
      ),
    );
  }
}
