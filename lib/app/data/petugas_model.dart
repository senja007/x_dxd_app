class PetugasModel {
  //final int? id;
  final String? nikPetugas;
  final String? namaPetugas;
  final String? noTelp;
  final String? email;
  final int? status;

  PetugasModel({
    this.status,
   // this.id,
    this.namaPetugas,
    this.nikPetugas,
    this.noTelp,
    this.email,
  });

  factory PetugasModel.fromJson(Map<String, dynamic> jsonData) {
    return PetugasModel(
      nikPetugas: jsonData['nikPetugas'] != null ? jsonData['nikPetugas'] : "",
      namaPetugas: jsonData['namaPetugas'] != null ? jsonData['namaPetugas'] : "",
      noTelp: jsonData['noTelp'] != null ? jsonData['noTelp'] : "",
      email: jsonData['email'] != null ? jsonData['email'] : "",
      status: jsonData['status'] != null ? jsonData['status'] : 0,
      //id: jsonData['id'] != null ? jsonData['id'] : 0,
    );
  }
}

class PetugasListModel {
  final int? status; // 200 - 204 - 400 - 404
  final List<PetugasModel>? content;
  final int? page;
  final int? size;
  final int? totalElements;
  final int? totalPages;
  PetugasListModel(
      {this.status,
      this.content,
      this.page,
      this.size,
      this.totalElements,
      this.totalPages});
  factory PetugasListModel.fromJson(Map<String, dynamic> jsonData) {
    return PetugasListModel(
        status: jsonData['status'],
        content: jsonData['content']
            .map<PetugasModel>((data) => PetugasModel.fromJson(data))
            .toList(),
        page: jsonData['page'],
        size: jsonData['size'],
        totalElements: jsonData['totalElements'],
        totalPages: jsonData['totalPages']);
  }
}
