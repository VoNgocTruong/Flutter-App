import 'package:flutter/material.dart';

List<String> listImage = [
  "https://img.meta.com.vn/Data/image/2022/01/13/anh-dep-thien-nhien-3.jpg",
  "https://img.meta.com.vn/Data/image/2022/01/13/anh-dep-thien-nhien-5.jpg",
  "https://nhadepso.com/wp-content/uploads/2023/01/tong-hop-50-hinh-anh-thien-nhien-dep-hung-vi-tho-mong_1.jpg",
  "https://i0.wp.com/thatnhucuocsong.com.vn/wp-content/uploads/2022/02/anh-thien-nhien.jpg",
  "https://nhadepso.com/wp-content/uploads/2023/01/tong-hop-50-hinh-anh-thien-nhien-dep-hung-vi-tho-mong_4.jpg",
  "https://recmiennam.com/wp-content/uploads/2018/01/phong-canh-thien-nhien-dep-1.jpg",
  "https://www.invert.vn/media/downloads/221203T1347_283.jpg",
  "https://haycafe.vn/wp-content/uploads/2021/12/hinh-anh-thien-nhien-phong-canh-Dai-Loan-dep-nhat.jpg",
];

class pageGridView extends StatelessWidget {
  const pageGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Image"),
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 300,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: List.generate(
            listImage.length, (index) => Container(
            child: Image.network(listImage[index], fit: BoxFit.cover) ,
        )
        ).toList(),
      ),
    );
  }
}
