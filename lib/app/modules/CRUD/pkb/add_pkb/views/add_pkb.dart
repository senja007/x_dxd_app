import 'package:crud_flutter_api/app/data/peternak_model.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_input.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_pkb_controller.dart';

class AddPkbView extends GetView<AddPkbController> {
  const AddPkbView({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7EBE1),
      appBar: AppBar(
        title: Text(
          'Tambah Data Pkb',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Ikon panah kembali
          onPressed: () {
            Navigator.of(context).pop(); // Aksi saat tombol diklik
          },
        ),
        backgroundColor: Color(0xff132137),
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: AppColor.secondaryExtraSoft,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 14, right: 14, top: 4),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
            ),
            child: TextField(
              style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
              maxLines: 1,
              controller: controller.idKejadianC,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text(
                  "Id Kejadian",
                  style: TextStyle(
                    color: AppColor.secondarySoft,
                    fontSize: 14,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
                hintText: "Id Kejadian",
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w500,
                  color: AppColor.secondarySoft,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 14, right: 14, top: 4),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
            ),
            child: TextField(
              style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
              maxLines: 1,
              controller: controller.idHewanC,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text(
                  "Id Hewan",
                  style: TextStyle(
                    color: AppColor.secondarySoft,
                    fontSize: 14,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
                hintText: "Id Hewan",
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w500,
                  color: AppColor.secondarySoft,
                ),
              ),
            ),
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   padding: EdgeInsets.only(left: 14, right: 14, top: 4),
          //   margin: EdgeInsets.only(bottom: 16),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(8),
          //     border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
          //   ),
          //   child: TextField(
          //     style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
          //     maxLines: 1,
          //     controller: controller.idPeternakC,
          //     keyboardType: TextInputType.text,
          //     decoration: InputDecoration(
          //       label: Text(
          //         "Id Peternak",
          //         style: TextStyle(
          //           color: AppColor.secondarySoft,
          //           fontSize: 14,
          //         ),
          //       ),
          //       floatingLabelBehavior: FloatingLabelBehavior.always,
          //       border: InputBorder.none,
          //       hintText: "Id Peternak",
          //       hintStyle: TextStyle(
          //         fontSize: 14,
          //         fontFamily: 'poppins',
          //         fontWeight: FontWeight.w500,
          //         color: AppColor.secondarySoft,
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   padding: EdgeInsets.only(left: 14, right: 14, top: 4),
          //   margin: EdgeInsets.only(bottom: 16),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(8),
          //     border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
          //   ),
          //   child: TextField(
          //     style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
          //     maxLines: 1,
          //     controller: controller.nikPeternakC,
          //     keyboardType: TextInputType.number,
          //     decoration: InputDecoration(
          //       label: Text(
          //         "NIK Peternak",
          //         style: TextStyle(
          //           color: AppColor.secondarySoft,
          //           fontSize: 14,
          //         ),
          //       ),
          //       floatingLabelBehavior: FloatingLabelBehavior.always,
          //       border: InputBorder.none,
          //       hintText: "NIK Peternak",
          //       hintStyle: TextStyle(
          //         fontSize: 14,
          //         fontFamily: 'poppins',
          //         fontWeight: FontWeight.w500,
          //         color: AppColor.secondarySoft,
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 14, right: 14, top: 4),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Text(
                    "Nama Peternak",
                    style: TextStyle(
                      color: AppColor.secondarySoft,
                      fontSize: 12,
                    ),
                  ),
                ),
                Obx(() {
                  return DropdownButton<String>(
                    value: controller.selectedPeternakId.value,
                    items:
                        controller.peternakList.map((PeternakModel peternak) {
                      return DropdownMenuItem<String>(
                        value: peternak.idPeternak ?? '',
                        child: Text(peternak.namaPeternak ?? ''),
                      );
                    }).toList(),
                    onChanged: (String? selectedId) {
                      controller.selectedPeternakId.value = selectedId ?? '';
                    },
                    hint: Text('Pilih Peternak'),
                  );
                }),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 14, right: 14, top: 4),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
            ),
            child: TextField(
              style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
              maxLines: 1,
              controller: controller.jumlahC,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text(
                  "Jumlah",
                  style: TextStyle(
                    color: AppColor.secondarySoft,
                    fontSize: 14,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
                hintText: "Jumlah",
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w500,
                  color: AppColor.secondarySoft,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 14, right: 14, top: 4),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
            ),
            child: TextField(
              style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
              maxLines: 1,
              controller: controller.kategoriC,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text(
                  "Kategori",
                  style: TextStyle(
                    color: AppColor.secondarySoft,
                    fontSize: 14,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
                hintText: "Kategori",
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w500,
                  color: AppColor.secondarySoft,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 14, right: 14, top: 4),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
            ),
            child: TextField(
              style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
              maxLines: 1,
              controller: controller.lokasiC,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text(
                  "Lokasi",
                  style: TextStyle(
                    color: AppColor.secondarySoft,
                    fontSize: 14,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
                hintText: "Lokasi",
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w500,
                  color: AppColor.secondarySoft,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 14, right: 14, top: 4),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
            ),
            child: TextField(
              style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
              maxLines: 1,
              controller: controller.spesiesC,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text(
                  "Spesies",
                  style: TextStyle(
                    color: AppColor.secondarySoft,
                    fontSize: 14,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
                hintText: "Spesies",
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w500,
                  color: AppColor.secondarySoft,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 14, right: 14, top: 4),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
            ),
            child: TextField(
              style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
              maxLines: 1,
              controller: controller.umurKebuntinganC,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text(
                  "Umur Kebuntingan",
                  style: TextStyle(
                    color: AppColor.secondarySoft,
                    fontSize: 14,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
                hintText: "Umur Kebuntingan",
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w500,
                  color: AppColor.secondarySoft,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 14, right: 14, top: 4),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
            ),
            child: TextField(
              style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
              maxLines: 1,
              controller: controller.pemeriksaKebuntinganC,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text(
                  "Pemeriksa Kebuntingan",
                  style: TextStyle(
                    color: AppColor.secondarySoft,
                    fontSize: 14,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
                hintText: "Pemeriksa Kebuntingan",
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w500,
                  color: AppColor.secondarySoft,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 14, right: 14, top: 4),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
            ),
            child: TextField(
              style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
              maxLines: 1,
              controller:
                  controller.tanggalPkbC, //editing controller of this TextField
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "Tanggal Pkb" //label text of field
                  ),
              readOnly:
                  true, //set it true, so that user will not able to edit text
              onTap: () => controller.tanggalPkb(context),
            ),
          ),
          SizedBox(height: 32),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Obx(
              () => ElevatedButton(
                onPressed: () {
                  if (controller.isLoading.isFalse) {
                    controller.addPKB(context);
                  }
                },
                child: Text(
                  (controller.isLoading.isFalse) ? 'Tambah post' : 'Loading...',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'poppins',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff132137),
                  padding: EdgeInsets.symmetric(vertical: 18),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
