import '../Model/CuaHang.dart';
import '../Model/DienThoai.dart';
import '../Model/HoaDon.dart';

void main() {
  try {
    var dienThoai1 = DienThoai("DT-001", "iPhone 14", "Apple", 1000, 1500, 50, true);
    var dienThoai2 = DienThoai("DT-002", "Samsung Galaxy S23", "Samsung", 800, 1200, 30, true);
    var cuaHang = CuaHang("Tech Store", "123 Cửa hàng, Hà Nội");

    cuaHang.themDienThoai(dienThoai1);
    cuaHang.themDienThoai(dienThoai2);

    print("Danh sách điện thoại trong cửa hàng:");
    cuaHang.hienThiDanhSachDienThoai();

    var hoaDon1 = HoaDon("HD-001", DateTime(2024, 11, 26), dienThoai1, 2, 1600, "Nguyễn Văn A", "0912345678");
    var hoaDon2 = HoaDon("HD-002", DateTime(2024, 11, 26), dienThoai2, 1, 1200, "Trần Thị B", "0987654321");

    cuaHang.taoHoaDon(hoaDon1);
    cuaHang.taoHoaDon(hoaDon2);

    print("\nDanh sách hóa đơn:");
    cuaHang.hienThiDanhSachHoaDon();

    var doanhThu = cuaHang.tinhDoanhThu(DateTime(2024, 11, 1), DateTime(2024, 11, 30));
    var loiNhuan = cuaHang.tinhLoiNhuan(DateTime(2024, 11, 1), DateTime(2024, 11, 30));
    
    print("\nDoanh thu tháng 11: \$${doanhThu}");
    print("Lợi nhuận tháng 11: \$${loiNhuan}");

    print("\nSố lượng tồn kho:");
    for (var dt in cuaHang.danhSachDienThoai) {
      print("${dt.tenDT}: ${dt.soLuongTon}");
    }
  } catch (e) {
    print("Lỗi: $e");
  }
}