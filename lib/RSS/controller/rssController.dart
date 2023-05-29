import 'dart:convert';
import 'package:flutter_ngoctruong/RSS/model/rssItemTemplate.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

String _rssURLVNExpress  = "https://vnexpress.net/rss/tin-moi-nhat.rss";
String _rssURLTuoitre = "https://tuoitre.vn/rss/tin-moi-nhat.rss";
String resourceName = "vnexpress";
class ControllerRss extends GetxController {
  final _rssList = <RSSItem>[].obs;
  List<RSSItem> get rssList => _rssList.value;
  @override
  void onInit() {
    // TODO: implement onInit
    readRss();
  }

  Future<List<dynamic>?> _fetchRSS(String rssURL) async {
    final response = await http.get(Uri.parse(rssURL));
    if(response.statusCode == 200) {
      final xml2Json = Xml2Json();
      xml2Json.parse(utf8.decode(response.bodyBytes));
      var rssJson = xml2Json.toParker();
      Map<String, dynamic> jsonData = jsonDecode(rssJson);
      return (jsonData["rss"]["channel"]["item"]);
    }
  return Future.error("Lỗi đọc Rss");
  }
  Future<void> readRss() async{
    _fetchRSS(_rssURLVNExpress)
        .then((value) {
          _rssList.value = value?.map(
                  (rssMap) => RSSItem.resourceNameOnly(rssResourceName: resourceName)
          .getFromJson(rssMap)).toList() ?? [];
          _rssList.refresh();
        },
    ).catchError((error){
          print(error);
    }
    );
  }
}