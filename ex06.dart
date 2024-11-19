/**
Bài tập:
1. Viết chương trình chuyển đổi 1 số 
nguyên (b>=1) được nhập từ bàn phím 
thành số nhị phân.
2. Viết chương trình tính tổng
 các ước số của một số nguyên được 
 nhập từ bàn phím (n>=1). 
 */

import 'dart:io';
import 'dart:math';


void main() {
  int? number;

  // Yêu cầu nhập số cho đến khi người dùng nhập đúng
  do {
    print("Nhập một số nguyên (b >= 1):");
    number = int.tryParse(stdin.readLineSync() ?? '');
    
    if (number == null || number < 1) {
      print("Giá trị không hợp lệ! Vui lòng nhập lại.");
    }
  } while (number == null || number < 1);

  // Chuyển đổi số nguyên thành số nhị phân
  String binary = decimalToBinary(number);
  
  print("Số nhị phân của $number là: $binary");
}

// Hàm chuyển đổi số nguyên thành số nhị phân
String decimalToBinary(int number) {
  String binary = '';
  while (number > 0) {
    binary = (number % 2).toString() + binary;
    number ~/= 2;
  }
  return binary;
}