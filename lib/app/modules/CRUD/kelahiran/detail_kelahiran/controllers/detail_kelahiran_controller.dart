import 'package:crud_flutter_api/app/data/kelahiran_model.dart';
import 'package:crud_flutter_api/app/data/petugas_model.dart';
import 'package:crud_flutter_api/app/modules/menu/kelahiran/controllers/kelahiran_controller.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/services/kelahiran_api.dart';
import 'package:crud_flutter_api/app/services/petugas_api.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_alert_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailKelahiranController extends GetxController {
  final Map<String, dynamic> argsData = Get.arguments;
  KelahiranModel? kelahiranModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  RxBool isEditing = false.obs;
  TextEditingController idKejadianC = TextEditingController();
  TextEditingController tanggalLaporanC = TextEditingController();
  TextEditingController tanggalLahirC = TextEditingController();
  TextEditingController lokasiC = TextEditingController();
  TextEditingController namaPeternakC = TextEditingController();
  TextEditingController idPeternakC = TextEditingController();
  TextEditingController kartuTernakIndukC = TextEditingController();
  TextEditingController eartagIndukC = TextEditingController();
  TextEditingController idHewanIndukC = TextEditingController();
  TextEditingController spesiesIndukC = TextEditingController();
  TextEditingController idPejantanStrawC = TextEditingController();
  TextEditingController idBatchStrawC = TextEditingController();
  TextEditingController produsenStrawC = TextEditingController();
  TextEditingController spesiesPejantanC = TextEditingController();
  TextEditingController jumlahC = TextEditingController();
  TextEditingController kartuTernakAnakC = TextEditingController();
  TextEditingController eartagAnakC = TextEditingController();
  TextEditingController idHewanAnakC = TextEditingController();
  TextEditingController jenisKelaminAnakC = TextEditingController();
  TextEditingController kategoriC = TextEditingController();
  TextEditingController petugasPelaporC = TextEditingController();
  TextEditingController urutanIbC = TextEditingController();

  String originalidKejadian = "";
  String originaltanggalLaporan = "";
  String originaltanggalLahir = "";
  String originallokasi = "";
  String originalnamaPeternak = "";
  String originalidPeternak = "";
  String originalkartuTernakInduk = "";
  String originaleartagInduk = "";
  String originalidHewanInduk = "";
  String originalspesiesInduk = "";
  String originalidPejantanStraw = "";
  String originalidBatchStraw = "";
  String originalprodusenStraw = "";
  String originalspesiesPejantan = "";
  String originaljumlah = "";
  String originalkartuTernakAnak = "";
  String originaleartagAnak = "";
  String originalidHewanAnak = "";
  String originaljenisKelaminAnak = "";
  String originalkategori = "";
  String originalpetugasPelapor = "";
  String originalurutanIb = "";

  
  @override
  onClose() {
    idKejadianC.dispose();
    tanggalLaporanC.dispose();
    tanggalLahirC.dispose();
    lokasiC.dispose();
    namaPeternakC.dispose();
    idPeternakC.dispose();
    kartuTernakIndukC.dispose();
    eartagIndukC.dispose();
    idHewanIndukC.dispose();
    spesiesIndukC.dispose();
    idPejantanStrawC.dispose();
    idBatchStrawC.dispose();
    produsenStrawC.dispose();
    spesiesPejantanC.dispose();
    jumlahC.dispose();
    kartuTernakAnakC.dispose();
    eartagAnakC.dispose();
    idHewanAnakC.dispose();
    jenisKelaminAnakC.dispose();
    kategoriC.dispose();
    petugasPelaporC.dispose();
    urutanIbC.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    idKejadianC.text = argsData["id_kejadian_detail"];
    tanggalLaporanC.text = argsData["tanggal_laporan_detail"];
    tanggalLahirC.text = argsData["tanggal_lahir_detail"];
    lokasiC.text = argsData["lokasi_detail"];
    namaPeternakC.text = argsData["nama_peternak_detail"];
    idPeternakC.text = argsData["id_peternak_detail"];
    kartuTernakIndukC.text = argsData["kartu_ternak_induk_detail"];
    eartagIndukC.text = argsData["eartag_induk_detail"];
    idHewanIndukC.text = argsData["id_hewan_induk_detail"];
    spesiesIndukC.text = argsData["spesies_induk_detail"];
    idPejantanStrawC.text = argsData["id_pejantan_detail"];
    idBatchStrawC.text = argsData["id_batch_detail"];
    produsenStrawC.text = argsData["produsen_detail"];
    spesiesPejantanC.text = argsData["spesies_pejantan_detail"];
    jumlahC.text = argsData["jumlah_detail"];
    kartuTernakAnakC.text = argsData["kartu_ternak_anak_detail"];
    eartagAnakC.text = argsData["eartag_anak_detail"];
    idHewanAnakC.text = argsData["id_hewan_anak_detail"];
    jenisKelaminAnakC.text = argsData["kelamin_anak_detail"];
    kategoriC.text = argsData["kategori_detail"];
    petugasPelaporC.text = argsData["petugas_pelapor_detail"];
    urutanIbC.text = argsData["urutan_ib_detail"];

    originalidKejadian = argsData["id_kejadian_detail"];
    originaltanggalLaporan = argsData["tanggal_laporan_detail"];
    originaltanggalLahir = argsData["tanggal_lahir_detail"];
    originallokasi = argsData["lokasi_detail"];
    originalnamaPeternak = argsData["nama_peternak_detail"];
    originalidPeternak = argsData["id_peternak_detail"];
    originalkartuTernakInduk = argsData["kartu_ternak_induk_detail"];
    originaleartagInduk = argsData["eartag_induk_detail"];
    originalidHewanInduk = argsData["id_hewan_induk_detail"];
    originalspesiesInduk = argsData["spesies_induk_detail"];
    originalidPejantanStraw = argsData["id_pejantan_detail"];
    originalidBatchStraw = argsData["id_batch_detail"];
    originalprodusenStraw = argsData["produsen_detail"];
    originalspesiesPejantan = argsData["spesies_pejantan_detail"];
    originaljumlah = argsData["jumlah_detail"];
    originalkartuTernakAnak = argsData["kartu_ternak_anak_detail"];
    originaleartagAnak = argsData["eartag_anak_detail"];
    originalidHewanAnak = argsData["id_hewan_anak_detail"];
    originaljenisKelaminAnak = argsData["kelamin_anak_detail"];
    originalkategori = argsData["kategori_detail"];
    originalpetugasPelapor = argsData["petugas_pelapor_detail"];
    originalurutanIb = argsData["urutan_ib_detail"];
  }

  Future<void> tombolEdit() async {
    isEditing.value = true;
    update();
  }

  Future<void> tutupEdit() async {
    isEditing.value = false;
  }

  Future<void> deleteKelahiran() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Hapus data todo",
      message: "Apakah anda ingin menghapus data todo ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        kelahiranModel = await KelahiranApi()
            .deleteKelahiranAPI(argsData["id_kejadian_detail"]);
        final KelahiranController kelahiranController =
            Get.put(KelahiranController());
        kelahiranController.reInitialize();
        Get.back();
        Get.back();
        update();
      },
    );
  }

  Future<void> editKelahiran() async {
    CustomAlertDialog.showPresenceAlert(
      title: "edit data Kelahiran",
      message: "Apakah anda ingin mengedit data Kelahiran ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back(); // close modal
        update();
        kelahiranModel = await KelahiranApi().editKelahiranApi(
          idKejadianC.text,
          tanggalLaporanC.text,
          tanggalLahirC.text,
          lokasiC.text,
          namaPeternakC.text,
          idPeternakC.text,
          kartuTernakIndukC.text,
          eartagIndukC.text,
          idHewanIndukC.text,
          spesiesIndukC.text,
          idPejantanStrawC.text,
          idBatchStrawC.text,
          produsenStrawC.text,
          spesiesPejantanC.text,
          jumlahC.text,
          kartuTernakAnakC.text,
          eartagAnakC.text,
          idHewanAnakC.text,
          jenisKelaminAnakC.text,
          kategoriC.text,
          petugasPelaporC.text,
          urutanIbC.text,
        );
        isEditing.value = false;
        // await PetugasApi().editPetugasApi(argsData["nikPetugas"], argsData["namaPetugas"], argsData["noTelp"],argsData["email"]);
        // if (petugasModel!.status == 200) {
        //   update();
        //   Get.offAndToNamed(Routes.HOME);
        // }
      },
    );
  }
}
