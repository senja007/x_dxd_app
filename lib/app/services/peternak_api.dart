import 'dart:convert';

import 'package:crud_flutter_api/app/data/peternak_model.dart';
import 'package:crud_flutter_api/app/utils/api.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/internetMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/loading.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

class PeternakApi extends SharedApi {
  // Login API
  Future<PeternakListModel> loadPeternakAPI() async {
    try {
      var data =
          await http.get(Uri.parse(baseUrl + '/peternak'), headers: getToken());
      // print("hasil" + data.statusCode.toString());
      // print(json.decode(data.body));
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);

        //print(jsonData['content']);

        return PeternakListModel.fromJson(
            {"status": 200, "content": jsonData['content']});
      } else {
        return PeternakListModel.fromJson(
            {"status": data.statusCode, "content": []});
      }
    } on Exception catch (_) {
      return PeternakListModel.fromJson({"status": 404, "content": []});
    }
  }

//ADD
  Future<PeternakModel?> addPeternakAPI(
      String idPeternak,
      String nikPeternak,
      String namaPeternak,
      String lokasi,
      String idISIKHNAS,
      String petugasPendaftar,
      String tanggalPendaftaran) async {
    try {
      var jsonData;
      showLoading();

      var bodyData = {
        'idPeternak': idPeternak,
        'nikPeternak': nikPeternak,
        'namaPeternak': namaPeternak,
        'idISIKHNAS': idISIKHNAS,
        'lokasi': lokasi,
        'petugasPendaftar': petugasPendaftar,
        'tanggalPendaftaran': tanggalPendaftaran
      };
      var data = await http.post(
        Uri.parse(baseUrl + '/peternak'),
        headers: {
          ...getToken(),
          'Content-Type': 'application/json',
        },
        body: jsonEncode(bodyData),
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 201) {
        showSuccessMessage(jsonData["message"]);
        Get.back();
        return PeternakModel.fromJson(jsonData);
      } else {
        showErrorMessage(jsonData['message']);
        return null; //InseminasiModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return PeternakModel.fromJson({"status": 404});
    }
  }

//EDIT
  Future<PeternakModel?> editPeternakApi(
      String idPeternak,
      String nikPeternak,
      String namaPeternak,
      String lokasi,
      String idISIKHNAS,
      String petugasPendaftar,
      String tanggalPendaftaran) async {
    try {
      var jsonData;
      showLoading();
      var bodyDataedit = {
        'idPeternak': idPeternak,
        'nikPeternak': nikPeternak,
        'namaPeternak': namaPeternak,
        'idISIKHNAS': idISIKHNAS,
        'lokasi': lokasi,
        'petugasPendaftar': petugasPendaftar,
        'tanggalPendaftaran': tanggalPendaftaran
      };

      var data = await http.put(
        Uri.parse(baseUrl + '/peternak/' + idPeternak.toString()),
        headers: {...getToken(), 'Content-Type': 'application/json'},
        body: jsonEncode(bodyDataedit),
      );
      print(data.body);
      stopLoading();

      jsonData = json.decode(data.body);
      if (data.statusCode == 201) {
        jsonData['statusCode'] = 201;
        print(data.body);
        print(jsonData);
        return PeternakModel.fromJson(jsonData);
      } else {
        showErrorMessage(jsonData['message']);
        return PeternakModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return PeternakModel.fromJson({"status": 404});
    }
  }

  Future<PeternakModel?> deletePeternakAPI(String id) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.delete(
        Uri.parse(baseUrl + '/peternak/' + id.toString()),
        headers: getToken(),
      );
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        // Simpan nilai jsonData['data'] dalam variabel baru
        var postData = <String, dynamic>{};
        postData["statusCode"] = 200;
        postData["status"] = 1;
        postData['id'] = 0;

        postData['content'] = "";

        print(postData);
        // Kirim variabel postData ke dalam fungsi InseminasiModel.fromJson
        return PeternakModel.fromJson(postData);
      } else {
        showErrorMessage(jsonData['message']);
        return PeternakModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Periksa koneksi internet anda");
      return PeternakModel.fromJson({"status": 404});
    }
  }
}
