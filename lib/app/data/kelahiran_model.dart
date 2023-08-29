class KelahiranModel {
  final int? id;
  final String? namaPetugas;
  final String? nikPetugas;
  final String? noTelp;
  final String? email;
  final int? status;

  KelahiranModel({
    this.status,
    this.id,
    this.namaPetugas,
    this.nikPetugas,
    this.noTelp,
    this.email,
  });

  factory KelahiranModel.fromJson(Map<String, dynamic> jsonData) {
    return KelahiranModel(
      status: jsonData['status'] != null ? jsonData['status'] : 0,
      id: jsonData['id'] != null ? jsonData['id'] : 0,
      namaPetugas:
          jsonData['namaPetugas'] != null ? jsonData['namaPetugas'] : "",
      nikPetugas: jsonData['nikPetugas'] != null ? jsonData['nikPetugas'] : "",
      noTelp: jsonData['noTelp'] != null ? jsonData['noTelp'] : "",
      email: jsonData['email'] != null ? jsonData['email'] : "",
    );
  }
}

class KelahiranListModel {
  final int? status; // 200 - 204 - 400 - 404
  final List<KelahiranModel>? content;
  final int? page;
  final int? size;
  final int? totalElements;
  final int? totalPages;
  KelahiranListModel(
      {this.status,
      this.content,
      this.page,
      this.size,
      this.totalElements,
      this.totalPages});
  factory KelahiranListModel.fromJson(Map<String, dynamic> jsonData) {
    return KelahiranListModel(
        status: jsonData['status'],
        content: jsonData['content']
            .map<KelahiranModel>((data) => KelahiranModel.fromJson(data))
            .toList(),
        page: jsonData['page'],
        size: jsonData['size'],
        totalElements: jsonData['totalElements'],
        totalPages: jsonData['totalPages']);
  }
}