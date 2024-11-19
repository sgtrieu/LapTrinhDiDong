import 'dart:io';

void main() {
  int? number;

  // Yêu cầu nhập số cho đến khi người dùng nhập đúng
  do {
    print("Nhập một số nguyên (n >= 1):");
    number = int.tryParse(stdin.readLineSync() ?? '');
    
    if (number == null || number < 1) {
      print("Giá trị không hợp lệ! Vui lòng nhập lại.");
    }
  } while (number == null || number < 1);

  // Lấy danh sách các ước và tính tổng
  List<int> divisors = findDivisors(number);
  int sum = divisors.reduce((a, b) => a + b);

  print("Các ước số của $number là: ${divisors.join(', ')}");
  print("Tổng các ước số của $number là: $sum");
}

// Hàm tìm các ước số của một số nguyên
List<int> findDivisors(int number) {
  List<int> divisors = [];
  for (int i = 1; i <= number; i++) {
    if (number % i == 0) {
      divisors.add(i);
    }
  }
  return divisors;
}
