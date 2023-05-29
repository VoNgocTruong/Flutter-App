import 'package:flutter/material.dart';
import 'package:flutter_ngoctruong/catalogGetx/pageCatalog.dart';
import 'package:flutter_ngoctruong/firebase/firebase_app.dart';
import 'package:flutter_ngoctruong/layout/pageGridView.dart';
import 'package:flutter_ngoctruong/layout/pageListView.dart';
import 'package:flutter_ngoctruong/phoneApp/pagePhoneApp.dart';
import 'package:flutter_ngoctruong/profile/PageMyProfile.dart';
import 'package:flutter_ngoctruong/pageInfoProduct.dart';
import 'GiaiCuuNS/pageGiaiCuuNS.dart';
import 'GiaiCuuNS/pageLogin.dart';
import 'GiaiCuuNS/pageTraiCayDetail.dart';
import 'RSS/page/pageRss.dart';
import 'firebase/authentication/pageLogin.dart';
import 'json_basic/pageListPhoto.dart';
import 'SQLite/page_sqlite_app.dart';
import 'catalogProvider/appCatalog.dart';

class pageHome extends StatelessWidget {
  const pageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            buildButton(context, title: "My Profile", destionation: PageMyProfile()),
            buildButton(context, title: "View List", destionation: pageListView()),
            buildButton(context, title: "View Image", destionation: pageGridView()),
            buildButton(context, title: "View Product", destionation: infoProduct()),
            buildButton(context, title: "View Catalog App", destionation: appCatalog()),
            buildButton(context, title: "View Json Data", destionation: pageListPhoto()),
            buildButton(context, title: "SQLITE", destionation: SQLiteApp()),
            buildButton(context, title: "View Catalog GetX", destionation: pageCatalogGetX()),
            buildButton(context, title: "Phone App", destionation: MyHomePage(title: 'Phone App',)),
            buildButton(context, title: "Firebase App", destionation: FirebaseApp()),
            buildButton(context, title: "Firebase Login", destionation: loginApp()),
            buildButton(context, title: "RSS", destionation: PageRss()),
            buildButton(context, title: "Giai Cuu NS", destionation: GCNSLogin()),
          ],
        ),
      ),
    );
  }

  Container buildButton(BuildContext context,
      {required String title, required Widget destionation}) {
    return Container(
      width: 180,
      child: ElevatedButton(
        child: Text(title),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => destionation));
        },
      ),
    );
  }
}