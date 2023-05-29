import 'dart:math';

void main(){
  // List<String> S = ["A","BC","CDDD","D"];
  // List<int> lens = S.map((e) => e.length).toList();
  // print(S);
  // print(lens);
  List<int> numbers = [1, 2, 3, 4, 5, 9, 88];
  numbers.forEach((element) {
    print(pow(element, 2));
  });
}