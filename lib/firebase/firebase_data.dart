import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

class SinhVien{
  String? id, ten, lop, dia_chi, ngay_sinh, anh;

  SinhVien({
    required this.id,
    required this.ten,
    this.lop,
    this.dia_chi,
    this.ngay_sinh,
    this.anh
  });

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'ten': this.ten,
      'lop': this.lop,
      'ngay_sinh': this.ngay_sinh,
      'dia_chi': this.dia_chi,
      'anh': this.anh,
    };
  }

  factory SinhVien.fromJson(Map<String, dynamic> map) {
    return SinhVien(
      id: map['id'],
      ten: map['ten'],
      lop: map['lop'],
      ngay_sinh: map['ngay_sinh'],
      dia_chi: map['dia_chi'],
      anh: map['anh'],
    );
  }
}

class SinhVienSnapshot{
  SinhVien? sinhVien;
  DocumentReference? documentRefernce;

  SinhVienSnapshot({
    required this.sinhVien,
    required this.documentRefernce,
  });

  factory SinhVienSnapshot.fromSnapshot(DocumentSnapshot docSnapSV) {
    return SinhVienSnapshot(
      sinhVien: SinhVien.fromJson(docSnapSV.data() as Map<String, dynamic>),
      documentRefernce: docSnapSV.reference,
    );
  }

  Future<void> capNhat(SinhVien sv) async{
    return documentRefernce!.update(sv.toJson());
  }
  Future<void> xoa() async{
    return documentRefernce!.delete();
  }
  static Future<DocumentReference> themMoi(SinhVien sv) async{
    return FirebaseFirestore.instance.collection("SinhVien").add(sv.toJson());
  }

  static Stream<List<SinhVienSnapshot>> dsSVTuFirebase(){
    Stream<QuerySnapshot> streamQS = FirebaseFirestore.instance.collection("SinhVien").snapshots();
    //chuyen Stream<QS> --> Stream<List<DS>>
    Stream<List<DocumentSnapshot>> StreamListDocSnap = streamQS.map((querySN) => querySN.docs);
    //map1: chuyen Stream<List>--> Stream<List khac kieu>
    //map2 chuyen List<DS> --> List<SVS>
    return StreamListDocSnap.map(
      (listDocSnap) =>
      listDocSnap.map((docSnap) =>SinhVienSnapshot.fromSnapshot(docSnap))
      .toList()
    );
  }

  static Stream<List<SinhVienSnapshot>> getAll(){
    Stream<QuerySnapshot> streamQS = FirebaseFirestore.instance.collection("SinhVien").snapshots();
    return streamQS.map((qs) => qs.docs.map((doc) => SinhVienSnapshot.fromSnapshot(doc)).toList());
  }

  static Future<List<SinhVienSnapshot>> dsSVTuFirebaseOneTime() async{
    QuerySnapshot qS = await FirebaseFirestore.instance.collection("SinhVien").get();
    return qS.docs.map((doc) => SinhVienSnapshot.fromSnapshot(doc)).toList();
  }
}
