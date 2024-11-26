import 'DienThoai.dart';

class HoaDon {
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuong;
  double _giaBan;
  String _tenNguoiMua;
  String _soDienThoai;

  // Constructor
  HoaDon(this._maHoaDon, this._ngayBan, this._dienThoai, this._soLuong, this._giaBan, this._tenNguoiMua, this._soDienThoai);

  // Getter/Setter with validation
  String get maHoaDon => _maHoaDon;
  set maHoaDon(String value) {
    if (value.isNotEmpty && value.startsWith('HD-')) {
      _maHoaDon = value;
    } else {
      throw Exception('Mã hóa đơn không hợp lệ');
    }
  }

  DateTime get ngayBan => _ngayBan;
  set ngayBan(DateTime value) {
    if (value.isBefore(DateTime.now())) {
      _ngayBan = value;
    } else {
      throw Exception('Ngày bán không hợp lệ');
    }
  }

  DienThoai get dienThoai => _dienThoai;
  set dienThoai(DienThoai value) {
    _dienThoai = value;
  }

  int get soLuong => _soLuong;
  set soLuong(int value) {
    if (value > 0 && value <= _dienThoai.soLuongTon) {
      _soLuong = value;
    } else {
      throw Exception('Số lượng mua không hợp lệ');
    }
  }

  double get giaBan => _giaBan;
  set giaBan(double value) {
    if (value > 0) {
      _giaBan = value;
    } else {
      throw Exception('Giá bán thực tế không hợp lệ');
    }
  }

  String get tenNguoiMua => _tenNguoiMua;
  set tenNguoiMua(String value) {
    if (value.isNotEmpty) {
      _tenNguoiMua = value;
    } else {
      throw Exception('Tên khách hàng không hợp lệ');
    }
  }

  String get soDienThoai => _soDienThoai;
  set soDienThoai(String value) {
    if (value.isNotEmpty && value.length == 10) {
      _soDienThoai = value;
    } else {
      throw Exception('Số điện thoại không hợp lệ');
    }
  }

  // Method to calculate total price
  double tinhTongTien() {
    return _soLuong * _giaBan;
  }

  // Method to calculate profit
  double tinhLoiNhuan() {
    return _soLuong * (_giaBan - _dienThoai.giaGoc);
  }

  // Method to display invoice information
  void hienThiThongTinHoaDon() {
    print("Hóa đơn: $_maHoaDon, Ngày bán: $_ngayBan, Người mua: $_tenNguoiMua, Số lượng: $_soLuong, Tổng tiền: ${tinhTongTien()}");
  }
}
