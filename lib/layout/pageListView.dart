import 'dart:math';

import 'package:flutter/material.dart';

List<String> fruits = [
  "táo", "chuối", "cam", "quả lựu", "nho", "dứa", "ổi", "xoài", "chanh", "bưởi",
  "cherry", "kiwi", "mâm xôi", "dừa", "quả mâm", "quả lê", "bí đao", "cà chua"
];
class pageListView extends StatelessWidget {
  const pageListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            leading: Text("${index + 1}"),
            title: Text(fruits[index]),
            trailing: Text("${Random().nextInt(100)} kg"),
            subtitle: Text("Giá: ${Random().nextInt(100)*10000} đồng"),
          ),
          separatorBuilder: (context, index) => Divider(thickness: 2),
          itemCount: fruits.length,
      ),
    );
  }
}
