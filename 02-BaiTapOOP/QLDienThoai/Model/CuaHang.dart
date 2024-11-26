import 'DienThoai.dart';
import 'HoaDon.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor
  CuaHang(this._tenCuaHang, this._diaChi);

  // Getter for danhSachDienThoai
  List<DienThoai> get danhSachDienThoai => _danhSachDienThoai;

  // Getter for danhSachHoaDon
  List<HoaDon> get danhSachHoaDon => _danhSachHoaDon;

  // Add a phone
  void themDienThoai(DienThoai dt) {
    _danhSachDienThoai.add(dt);
  }

  // Create an invoice
  void taoHoaDon(HoaDon hd) {
    _danhSachHoaDon.add(hd);
    // Update stock
    hd.dienThoai.soLuongTon -= hd.soLuong;
  }

  // Show store information
  void hienThiThongTinCuaHang() {
    print("Tên cửa hàng: $_tenCuaHang, Địa chỉ: $_diaChi");
  }

  // Show phone list
  void hienThiDanhSachDienThoai() {
    for (var dt in _danhSachDienThoai) {
      dt.hienThiThongTin();
    }
  }

  // Show invoice list
  void hienThiDanhSachHoaDon() {
    for (var hd in _danhSachHoaDon) {
      hd.hienThiThongTinHoaDon();
    }
  }

  // Calculate revenue
  double tinhDoanhThu(DateTime tuNgay, DateTime denNgay) {
    double doanhThu = 0;
    for (var hoaDon in _danhSachHoaDon) {
      if (hoaDon.ngayBan.isAfter(tuNgay) && hoaDon.ngayBan.isBefore(denNgay)) {
        doanhThu += hoaDon.tinhTongTien();
      }
    }
    return doanhThu;
  }

  // Calculate profit
  double tinhLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    double loiNhuan = 0;
    for (var hoaDon in _danhSachHoaDon) {
      if (hoaDon.ngayBan.isAfter(tuNgay) && hoaDon.ngayBan.isBefore(denNgay)) {
        loiNhuan += hoaDon.tinhLoiNhuan();
      }
    }
    return loiNhuan;
  }
}
