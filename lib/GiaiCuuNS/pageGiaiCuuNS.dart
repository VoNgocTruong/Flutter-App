import 'package:flutter/material.dart';
import 'package:flutter_ngoctruong/GiaiCuuNS/firebaseData.dart';
import 'package:flutter_ngoctruong/GiaiCuuNS/pageTraiCayDetail.dart';
import 'package:flutter_ngoctruong/firebase/firebase_widget.dart';
class pageGiaiCuuNongSan extends StatefulWidget {
  const pageGiaiCuuNongSan({Key? key}) : super(key: key);
  @override
  State<pageGiaiCuuNongSan> createState() => _FirebaseAppState();
}
class _FirebaseAppState extends State<pageGiaiCuuNongSan> {
  @override
  Widget build(BuildContext context) {
    return WidgetConnectFirebase(builder: (context) => pageListTraiCay(),
        connectingMessage: "quay deu quay deu quay deu",
        errorMessage: "Loi");
  }
}
class pageListTraiCay extends StatelessWidget {
  BuildContext? dialogContext;
  pageListTraiCay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giải Cứu Nông Sản"),

      ),
      body: StreamBuilder<List<TraiCaySnapshot>>(
        stream: TraiCaySnapshot.getAll(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            print(snapshot.error);
            return const Center(
              child: Text ("Lỗi hiển thị", style: TextStyle(color: Colors.red),),
            );
          }
          else
          if(!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            return GridView.extent(
                maxCrossAxisExtent: 250,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: List.generate(
                  snapshot.data!.length,
                      (index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => pageTraiCayDetail(traiCaySnapshot: snapshot.data![index]),)
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(border: Border.all(color: Colors.black)
                          ),
                          child: Column(
                            children: [
                              Image.network("${snapshot.data![index].traiCay!.url}", width: 250, height: 170,fit: BoxFit.fill,),
                              Text("${snapshot.data![index].traiCay!.ten}", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("Giá ${snapshot.data![index].traiCay!.gia} vnđ/kg", style: TextStyle(color: Colors.red),)
                            ],
                          ),
                        ),
                      )
              )
            );
          }
        },
      ),
    );
  }
}

