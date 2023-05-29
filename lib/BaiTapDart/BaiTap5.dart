import 'dart:io';

List<int> getFactors(int number) {
  List<int> factors = [];
  for (int i = 1; i <= number; i++) {
    if (number % i == 0) {
      factors.add(i);
    }
  }
  return factors;
}
void processInput(dynamic input) {
  if(input is String) {
    print(input.toUpperCase());
  } else if (input is int) {
    print(getFactors(input));
  } else if (input is double) {
    print(input.toInt());
  } else {
    print("Không thuộc 3 kiểu trên");
  }
}
void main(){
  processInput(8.3);
}
