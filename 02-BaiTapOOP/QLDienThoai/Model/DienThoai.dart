class DienThoai {
  String _maDT;
  String _tenDT;
  String _hangSX;
  double _giaGoc;
  double _giaBan;
  int _soLuongTon;
  bool _trangThai;

  // Constructor
  DienThoai(this._maDT, this._tenDT, this._hangSX, this._giaGoc, this._giaBan, this._soLuongTon, this._trangThai);

  // Getter/Setter with validation
  String get maDT => _maDT;
  set maDT(String value) {
    if (value.isNotEmpty && value.startsWith('DT-')) {
      _maDT = value;
    } else {
      throw Exception('Mã điện thoại không hợp lệ');
    }
  }

  String get tenDT => _tenDT;
  set tenDT(String value) {
    if (value.isNotEmpty) {
      _tenDT = value;
    } else {
      throw Exception('Tên điện thoại không hợp lệ');
    }
  }

  String get hangSX => _hangSX;
  set hangSX(String value) {
    if (value.isNotEmpty) {
      _hangSX = value;
    } else {
      throw Exception('Hãng sản xuất không hợp lệ');
    }
  }

  double get giaGoc => _giaGoc;
  set giaGoc(double value) {
    if (value > 0) {
      _giaGoc = value;
    } else {
      throw Exception('Giá gốc phải lớn hơn 0');
    }
  }

  double get giaBan => _giaBan;
  set giaBan(double value) {
    if (value > 0 && value > _giaGoc) {
      _giaBan = value;
    } else {
      throw Exception('Giá bán phải lớn hơn giá gốc');
    }
  }

  int get soLuongTon => _soLuongTon;
  set soLuongTon(int value) {
    if (value >= 0) {
      _soLuongTon = value;
    } else {
      throw Exception('Số lượng tồn không hợp lệ');
    }
  }

  bool get trangThai => _trangThai;
  set trangThai(bool value) {
    _trangThai = value;
  }

  // Method to calculate profit
  double tinhLoiNhuan() {
    return (_giaBan - _giaGoc) * _soLuongTon;
  }

  // Method to display information
  void hienThiThongTin() {
    print("Mã điện thoại: $_maDT, Tên: $_tenDT, Hãng: $_hangSX, Giá gốc: $_giaGoc, Giá bán: $_giaBan, Số lượng tồn: $_soLuongTon, Trạng thái: $_trangThai");
  }

  // Method to check if phone can be sold
  bool coTheBan() {
    return _soLuongTon > 0 && _trangThai;
  }
}
