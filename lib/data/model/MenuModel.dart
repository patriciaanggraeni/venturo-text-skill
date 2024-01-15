import '../../domain/entity/Menu.dart';

class MenuModel extends Menu {

  MenuModel({
    required int id,
    required String nama,
    required int harga,
    required String tipe,
    required String gambar,
  }) : super(id: id, nama: nama, harga: harga, tipe: tipe, gambar: gambar );

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'],
      tipe: json['tipe'],
      gambar: json['gambar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'harga': harga,
      'tipe': tipe,
      'gambar': gambar,
    };
  }
}