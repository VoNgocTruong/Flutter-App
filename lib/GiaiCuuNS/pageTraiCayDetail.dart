import 'package:flutter/material.dart';
import 'package:flutter_ngoctruong/GiaiCuuNS/firebaseData.dart';

class pageTraiCayDetail extends StatefulWidget {
  TraiCaySnapshot traiCaySnapshot;
  pageTraiCayDetail({Key? key, required this.traiCaySnapshot}) : super(key: key);

  @override
  State<pageTraiCayDetail> createState() => _pageTraiCayDetailState();
}

class _pageTraiCayDetailState extends State<pageTraiCayDetail> {
  TraiCaySnapshot? traiCaySnapshot;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Thông tin chi tiết"),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${traiCaySnapshot?.traiCay?.ten}")
          ],
        ),
      ),
    );
  }
}
