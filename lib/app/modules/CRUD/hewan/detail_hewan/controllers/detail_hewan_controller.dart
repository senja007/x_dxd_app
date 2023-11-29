import 'dart:io';

import 'package:crud_flutter_api/app/data/hewan_model.dart';
import 'package:crud_flutter_api/app/data/peternak_model.dart';
import 'package:crud_flutter_api/app/modules/menu/hewan/controllers/hewan_controller.dart';
import 'package:crud_flutter_api/app/services/hewan_api.dart';
import 'package:crud_flutter_api/app/services/peternak_api.dart';
import 'package:crud_flutter_api/app/utils/api.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
import 'package:crud_flutter_api/app/widgets/message/errorMessage.dart';
import 'package:crud_flutter_api/app/widgets/message/successMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DetailHewanController extends GetxController {
  final HewanController hewanController = Get.put(HewanController());
  //TODO: Implement DetailPostController
  final Map<String, dynamic> argsData = Get.arguments;
  HewanModel? hewanModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  RxBool isEditing = false.obs;
  RxString selectedPeternakId = ''.obs;
  RxList<PeternakModel> peternakList = <PeternakModel>[].obs;
  SharedApi sharedApi = SharedApi();
  RxString strLatLong =
      'belum mendapatkan lat dan long, silakan tekan tombol'.obs;
  RxString strAlamat = 'mencari lokasi..'.obs;
  RxBool loading = false.obs;
  RxString latitude = ''.obs;
  RxString longitude = ''.obs;
  Rx<File?> fotoHewan = Rx<File?>(null);

  TextEditingController kodeEartagNasionalC = TextEditingController();
  TextEditingController noKartuTernakC = TextEditingController();
  TextEditingController provinsiC = TextEditingController();
  TextEditingController kabupatenC = TextEditingController();
  TextEditingController kecamatanC = TextEditingController();
  TextEditingController desaC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController nikPeternakC = TextEditingController();
  TextEditingController spesiesC = TextEditingController();
  TextEditingController sexC = TextEditingController();
  TextEditingController umurC = TextEditingController();
  TextEditingController identifikasiHewanC = TextEditingController();
  TextEditingController petugasPendaftarC = TextEditingController();
  TextEditingController tanggalTerdaftarC = TextEditingController();

  String originalEartag = "";
  String originalKartuTernak = "";
  String originalProvinsi = "";
  String originalKabupaten = "";
  String originalKecamatan = "";
  String originalDesa = "";
  String originalNamaPeternak = "";
  String originalIdPeternak = "";
  String originalNikPeternak = "";
  String originalSpesies = "";
  String originalSex = "";
  String originalUmur = "";
  String originalIdentifikasi = "";
  String originalPetugas = "";
  String originalTanggal = "";
  String originalfotoHewan = "";
  String originalLatitude = "";
  String originalLongitude = "";

  @override
  onClose() {
    kodeEartagNasionalC.dispose();
    noKartuTernakC.dispose();
    provinsiC.dispose();
    kabupatenC.dispose();
    kecamatanC.dispose();
    desaC.dispose();
    namaPeternakC.dispose();
    idPeternakC.dispose();
    nikPeternakC.dispose();
    spesiesC.dispose();
    sexC.dispose();
    umurC.dispose();
    identifikasiHewanC.dispose();
    petugasPendaftarC.dispose();
    tanggalTerdaftarC.dispose();
    ever<File?>(fotoHewan, (_) {
      update();
    });
    //fotoHewanC.dispose();
    //fotoHewanC;
  }

  @override
  void onInit() {
    super.onInit();
    fetchPeternaks();
    isEditing.value = false;
    //print(fotoHewanC);
    kodeEartagNasionalC.text = argsData["eartag_hewan_detail"];
    noKartuTernakC.text = argsData["kartu_hewan_detail"];
    provinsiC.text = argsData["provinsi_hewan_detail"];
    kabupatenC.text = argsData["kabupaten_hewan_detail"];
    kecamatanC.text = argsData["kecamatan_hewan_detail"];
    desaC.text = argsData["desa_hewan_detail"];
    namaPeternakC.text = argsData["nama_peternak_hewan_detail"];
    idPeternakC.text = argsData["id_peternak_hewan_detail"];
    nikPeternakC.text = argsData["nik_hewan_detail"];
    spesiesC.text = argsData["spesies_hewan_detail"];
    sexC.text = argsData["kelamin_hewan_detail"];
    umurC.text = argsData["umur_hewan_detail"];
    identifikasiHewanC.text = argsData["identifikasi_hewan_detail"];
    petugasPendaftarC.text = argsData["petugas_terdaftar_hewan_detail"];
    tanggalTerdaftarC.text = argsData["tanggal_terdaftar_hewan_detail"];
    //fotoHewanC.text = argsData["foto_hewan_detail"];
    //fotoHewan.value = File(argsData["foto_hewan_detail"]);

    print(argsData["foto_hewan_detail"]);

    originalEartag = argsData["eartag_hewan_detail"];
    originalKartuTernak = argsData["kartu_hewan_detail"];
    originalProvinsi = argsData["provinsi_hewan_detail"];
    originalKabupaten = argsData["kabupaten_hewan_detail"];
    originalKecamatan = argsData["kecamatan_hewan_detail"];
    originalDesa = argsData["desa_hewan_detail"];
    originalNamaPeternak = argsData["nama_peternak_hewan_detail"];
    originalIdPeternak = argsData["id_peternak_hewan_detail"];
    originalNikPeternak = argsData["nik_hewan_detail"];
    originalSpesies = argsData["spesies_hewan_detail"];
    originalSex = argsData["kelamin_hewan_detail"];
    originalUmur = argsData["umur_hewan_detail"];
    originalIdentifikasi = argsData["identifikasi_hewan_detail"];
    originalPetugas = argsData["petugas_terdaftar_hewan_detail"];
    originalTanggal = argsData["tanggal_terdaftar_hewan_detail"];
    originalfotoHewan = argsData["foto_hewan_detail"];
  }

  Future<List<PeternakModel>> fetchPeternaks() async {
    try {
      final PeternakListModel peternakListModel =
          await PeternakApi().loadPeternakApi();
      final List<PeternakModel> peternaks = peternakListModel.content ?? [];
      if (peternaks.isNotEmpty) {
        selectedPeternakId.value = peternaks.first.idPeternak ?? '';
      }
      peternakList.assignAll(peternaks);
      return peternaks;
    } catch (e) {
      print('Error fetching peternaks: $e');
      showErrorMessage("Error fetching peternaks: $e");
      return [];
    }
  }

  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //location service not enabled, don't continue
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location service Not Enabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }

    //permission denied forever
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permission denied forever, we cannot access',
      );
    }
    //continue accessing the position of device
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  //getAddress
  Future<void> getAddressFromLongLat(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);

    Placemark place = placemarks[0];

    latitude.value = position.latitude.toString();
    longitude.value = position.longitude.toString();

    strAlamat.value =
        '${place.subAdministrativeArea}, ${place.subLocality}, ${place.locality}, '
        '${place.postalCode}, ${place.country}, ${place.administrativeArea}';
  }

  // Fungsi untuk mendapatkan alamat dari geolocation dan mengupdate nilai provinsi, kabupaten, kecamatan, dan desa
  Future<void> updateAlamatInfo() async {
    try {
      isLoading.value = true;

      // Mendapatkan posisi geolokasi
      Position position = await getGeoLocationPosition();

      // Mendapatkan alamat dari geolokasi
      await getAddressFromLongLat(position);

      // Mengupdate nilai provinsi, kabupaten, kecamatan, dan desa berdasarkan alamat
      provinsiC.text = getAlamatInfo(5); //benar 5
      kabupatenC.text = getAlamatInfo(0); //benar 0
      kecamatanC.text = getAlamatInfo(2); //benar 2
      desaC.text = getAlamatInfo(1); //benar 1
    } catch (e) {
      print('Error updating alamat info: $e');
      showErrorMessage("Error updating alamat info: $e");
    } finally {
      isLoading.value = false;
    }
  }

// Fungsi untuk mendapatkan informasi alamat berdasarkan index
  String getAlamatInfo(int index) {
    List<String> alamatInfo = strAlamat.value.split(', ');
    if (index < alamatInfo.length) {
      return alamatInfo[index];
    } else {
      return '';
    }
  }

  // Fungsi untuk memilih gambar dari galeri
  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      fotoHewan.value = File(pickedFile.path);
      update(); // Perbarui UI setelah memilih gambar
    }
  }

  // Fungsi untuk menghapus gambar yang sudah dipilih
  void removeImage() {
    fotoHewan.value = null;
    update(); // Perbarui UI setelah menghapus gambar
  }

  Future<void> tombolEdit() async {
    isEditing.value = true;
    update();
  }

  Future<void> tutupEdit() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Batal Edit",
      message: "Apakah anda ingin keluar dari edit ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back();
        update();
        // Reset data ke yang sebelumnya
        kodeEartagNasionalC.text = originalEartag;
        noKartuTernakC.text = originalKartuTernak;
        provinsiC.text = originalProvinsi;
        kabupatenC.text = originalKabupaten;
        kecamatanC.text = originalKecamatan;
        desaC.text = originalDesa;
        namaPeternakC.text = originalNamaPeternak;
        idPeternakC.text = originalIdPeternak;
        nikPeternakC.text = originalNikPeternak;
        spesiesC.text = originalSpesies;
        sexC.text = originalSex;
        umurC.text = originalUmur;
        identifikasiHewanC.text = originalIdentifikasi;
        petugasPendaftarC.text = originalPetugas;
        tanggalTerdaftarC.text = originalTanggal;
        fotoHewan.value = null;
        latitude.value = originalLatitude;
        longitude.value = originalLongitude;
        isEditing.value = false;
      },
    );
  }

  Future<void> deleteHewan() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Hapus data Hewan",
      message: "Apakah anda ingin menghapus data Hewan ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        hewanModel =
            await HewanApi().deleteHewanApi(argsData["eartag_hewan_detail"]);
        if (hewanModel?.status == 200) {
          showSuccessMessage(
              "Berhasil Hapus Data Hewan dengan ID: ${kodeEartagNasionalC.text}");
        } else {
          showErrorMessage("Gagal Hapus Data Hewan");
        }
        final HewanController hewanController = Get.put(HewanController());
        hewanController.reInitialize();
        Get.back();
        Get.back();
        update();
      },
    );
  }

  Future<void> editHewan() async {

    CustomAlertDialog.showPresenceAlert(
      title: "edit data Hewan",
      message: "Apakah anda ingin mengedit data ini data Petugas ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        
        await updateAlamatInfo();
        hewanModel = await HewanApi().editHewanApi(
          kodeEartagNasionalC.text,
          noKartuTernakC.text,
          provinsiC.text,
          kabupatenC.text,
          kecamatanC.text,
          desaC.text,
          selectedPeternakId.value,
          idPeternakC.text,
          nikPeternakC.text,
          spesiesC.text,
          sexC.text,
          umurC.text,
          identifikasiHewanC.text,
          petugasPendaftarC.text,
          tanggalTerdaftarC.text,
          fotoHewan.value,
          latitude: latitude.value,
          longitude: longitude.value,
        );
        isEditing.value = false;

        
        if (hewanModel != null) {
        if (hewanModel!.status == 201) {
          showSuccessMessage(
              "Berhasil mengedit Hewan dengan ID: ${kodeEartagNasionalC.text}");
        } else {
          showErrorMessage("Gagal mengedit Data Hewan ");
        }
      } else {
        // Handle the case where hewanModel is null
        showErrorMessage("Gagal mengedit Data Hewan. Response is null");
      }

        hewanController.reInitialize();
        
        Get.back();
        Get.back(); 
        update();
      },
    );
  }
}
