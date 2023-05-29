import 'package:cloud_firestore/cloud_firestore.dart';
class TraiCay {
  String? ten, gia, url;

  TraiCay({
    this.ten,
    this.url,
    this.gia,
  });

  Map<String, dynamic> toJson() {
    return {
      'ten': this.ten,
      'gia': this.gia,
      'url': this.url,
    };
  }
  factory TraiCay.fromJson(Map<String, dynamic> map) {
    return TraiCay(
      ten: map['ten'],
      gia: map['gia'],
      url: map['url'],
    );
  }
}

class TraiCaySnapshot {
  TraiCay? traiCay;
  DocumentReference? documentRefernce;

  TraiCaySnapshot({
    required this.traiCay,
    required this.documentRefernce,
  });

  factory TraiCaySnapshot.fromSnapshot(DocumentSnapshot docSnapTraiCay) {
    return TraiCaySnapshot(
      traiCay: TraiCay.fromJson(docSnapTraiCay.data() as Map<String, dynamic>),
      documentRefernce: docSnapTraiCay.reference,
    );
  }

  static Stream<List<TraiCaySnapshot>> getAll(){
    Stream<QuerySnapshot> streamQS = FirebaseFirestore.instance.collection("TraiCays").snapshots();
    return streamQS.map((qs) => qs.docs.map((doc) => TraiCaySnapshot.fromSnapshot(doc)).toList());
  }

}