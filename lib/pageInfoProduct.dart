import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class infoProduct extends StatefulWidget {
  const infoProduct({Key? key}) : super(key: key);

  @override
  State<infoProduct> createState() => _infoProductState();
}

class _infoProductState extends State<infoProduct> {
  List<String> linkImageProduct = [
    'assets/images/gearvn.png',
    'assets/images/gearvn1.png',
    'assets/images/gearvn2.png',
  ];
  int imagePosition = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giới Thiệu SP"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CarouselSlider.builder(
                    itemCount: linkImageProduct.length,
                    itemBuilder: (context, index, realIndex) => Container(
                      child: Image.asset(linkImageProduct[index]),
                    ),
                      options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            imagePosition = index;
                          });
                        },
                    )
                ),
              ),
              SizedBox( height: 20,),
              Row(
                children: [
                  SizedBox(width: 350,),
                  Text("${imagePosition+1}/${linkImageProduct.length}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                ],
              ),
              const SizedBox( height: 20,),
              const Text("[Chính hãng] Ram laptop ASus 8G DDR5 36000GHz",style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
              const SizedBox( height: 20,),
              Row(
                children: const [
                  Text("900.000đ ", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)
                  ),
                  SizedBox(width: 10),
                  Text("125.000đ", style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 18, )
                  ),
                ],
              ),
              const SizedBox( height: 30,),
              Row(
                children: const [
                  Text("4.0", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                  )
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Colors.yellowAccent),
                  Icon(Icons.star, color: Colors.yellowAccent),
                  Icon(Icons.star, color: Colors.yellowAccent),
                  Icon(Icons.star, color: Colors.yellowAccent),
                  Icon(Icons.star, color: Colors.black),
                  SizedBox(width: 120),
                  Text("Xem 200 đánh giá", style: TextStyle(
                    color: Colors.blue
                  ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}