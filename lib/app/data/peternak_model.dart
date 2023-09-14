import 'package:crud_flutter_api/app/data/peternak_model.dart';

class PeternakModel {
  
  final String? idPeternak;
  final String? nikPeternak;
  final String? namaPeternak;
  final String? idISIKHNAS;
  final String? lokasi;
  final String? petugasPendaftar;
  final String? tanggalPendaftaran;

  final int? status;

  PeternakModel({
    
    this.status,
    this.idPeternak,
    this.nikPeternak,
    this.namaPeternak,
    this.idISIKHNAS,
    this.lokasi,
    this.petugasPendaftar,
    this.tanggalPendaftaran,
  });

  factory PeternakModel.fromJson(Map<String, dynamic> jsonData) {
    return PeternakModel(
      status: jsonData['status'] != null ? jsonData['status'] : 0,
      idPeternak: jsonData['idPeternak'] != null ? jsonData['idPeternak'] : "",
      nikPeternak: jsonData['nikPeternak'] != null ? jsonData['nikPeternak'] : "",
      namaPeternak: jsonData['namaPeternak'] != null ? jsonData['namaPeternak'] : "",
      idISIKHNAS: jsonData['idISIKHNAS'] != null ? jsonData['idISIKHNAS'] : "",
      lokasi: jsonData['lokasi'] != null ? jsonData['lokasi'] : "",
      petugasPendaftar: jsonData['petugasPendaftar'] != null ? jsonData['petugasPendaftar'] : "",
      tanggalPendaftaran: jsonData['tanggalPendaftaran'] != null ? jsonData['tanggalPendaftaran'] : "",
    );
  }
}

class PeternakListModel {
  final int? status; // 200 - 204 - 400 - 404
  final List<PeternakModel>? content;
  final int? page;
  final int? size;
  final int? totalElements;
  final int? totalPages;
  PeternakListModel(
      {this.status,
      this.content,
      this.page,
      this.size,
      this.totalElements,
      this.totalPages});
  factory PeternakListModel.fromJson(Map<String, dynamic> jsonData) {
    return PeternakListModel(
        status: jsonData['status'],
        content: jsonData['content']
            .map<PeternakModel>((data) => PeternakModel.fromJson(data))
            .toList(),
        page: jsonData['page'],
        size: jsonData['size'],
        totalElements: jsonData['totalElements'],
        totalPages: jsonData['totalPages']);
  }
}
