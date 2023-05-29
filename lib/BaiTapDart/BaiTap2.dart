class SinhVien {
  String id,ten;
  String? ngaySinh,queQuan;

  SinhVien({
    required this.id,
    required this.ten,
    this.ngaySinh,
    this.queQuan,
  });

  @override
  String toString() {
    return 'Thông tin sinh viên : \n Mã sinh viên: $id, \n ten: $ten, \n ngaySinh: $ngaySinh, \n queQuan: $queQuan ';
  }
}

class QL_SinhVien {
  List<SinhVien> dsSinhVien = [];
  void add(SinhVien sv) {
    for(SinhVien s in dsSinhVien) {
      if (s.id == sv.id ) return;
    }
    dsSinhVien.add(sv);
  }
  void inDS() {
    dsSinhVien.forEach((element) {
      print(element.toString());
    });
  }
}
void main() {
  QL_SinhVien QLSV = QL_SinhVien();
  SinhVien sv1 = SinhVien(id: '01', ten: 'Trường',ngaySinh: '05/06/2002',queQuan: 'Ninh Thuận');
  QLSV.add(sv1);
  QLSV.inDS();
}