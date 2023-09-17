import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:crud_flutter_api/app/widgets/message/auto_load.dart';
import 'package:crud_flutter_api/app/widgets/message/empty.dart';
import 'package:crud_flutter_api/app/widgets/message/no_data.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../menu_view/views/menu_view.dart';
import '../controllers/inseminasi_controller.dart';

class InseminasiView extends GetView<InseminasiController> {
  const InseminasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InseminasiController>(
      builder: (controller) => RefreshIndicator(
        onRefresh: () async {
          await controller.loadInseminasi();
        },
        child: Scaffold(
          backgroundColor: AppColor.primary,
          appBar: AppBar(
            title: Text(
              'Semua Data',
              style: TextStyle(
                color: AppColor.secondaryExtraSoft,
              ),
            ),
            backgroundColor: Color(0xff132137),
            elevation: 0,
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 5,
                color: AppColor.primary,
              ),
            ),
          ),
          //body: Container(),
          body: GetBuilder<InseminasiController>(
            builder: (controller) => controller.posts?.status == 200
                ? controller.posts!.content!.isEmpty
                    ? EmptyView()
                    : ListView.separated(
                        itemCount: controller.posts!.content!.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          var postData = controller.posts!.content![index];
                          return InkWell(
                            onTap: () => {
                              Get.toNamed(
                                Routes.DETAILINSEMINASI,
                                arguments: {
                                  "idInseminasi": "${postData.idInseminasi}",
                                  "tanggalIB": "${postData.tanggalIB}",
                                  "lokasi": "${postData.lokasi}",
                                  "namaPeternak": "${postData.namaPeternak}",
                                  "idPeternak": "${postData.idPeternak}",
                                  "idHewan": "${postData.idHewan}",
                                  "eartag": "${postData.eartag}",
                                  "ib1": "${postData.ib1}",
                                  "ib2": "${postData.ib2}",
                                  "ib3": "${postData.ib3}",
                                  "ibLain": "${postData.ibLain}",
                                  "idPejantan": "${postData.idPejantan}",
                                  "idPembuatan": "${postData.idPembuatan}",
                                  "bangsaPejantan":
                                      "${postData.bangsaPejantan}",
                                  "produsen": "${postData.produsen}",
                                  "inseminator": "${postData.inseminator}",
                                },
                              ),
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 5),
                                    color: Color.fromARGB(255, 0, 47, 255)
                                        .withOpacity(.2),
                                    spreadRadius: 2,
                                    blurRadius:
                                        10, // changes position of shadow
                                  ),
                                ],
                                color: AppColor.primaryExtraSoft,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    width: 1, color: AppColor.primaryExtraSoft),
                              ),
                              padding: EdgeInsets.only(
                                  left: 20, top: 15, right: 29, bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        (postData.status == null)
                                            ? "-"
                                            : "ID Inseminasi: ${postData.idInseminasi}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        (postData.status == null)
                                            ? "-"
                                            : "Nama Peternak: ${postData.namaPeternak}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        (postData.status == null)
                                            ? "-"
                                            : "ID Peternak: "
                                                "${postData.idPeternak}",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                : NoData(),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                Get.toNamed(Routes.ADDINSEMINASI);
              },
              child: Icon(Icons.add),
              backgroundColor: Color(0xff132137),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}


// class InseminasiView extends GetView<InseminasiController> {
//   const InseminasiView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<InseminasiController>(
//       builder: (controller) => RefreshIndicator(
//         onRefresh: () => controller.refreshInseminasi(),
//         child: AutoLoad(
//           onInit: () async {
//             await controller.loadInseminasi();
//           },
//           child: Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 'Semua Data',
//                 style: TextStyle(
//                   color: AppColor.secondaryExtraSoft,
//                 ),
//               ),
//               backgroundColor: Color(0xff132137),
//               elevation: 0,
//               centerTitle: true,
//               bottom: PreferredSize(
//                 preferredSize: Size.fromHeight(1),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 1,
//                   color: AppColor.secondaryExtraSoft,
//                 ),
//               ),
//             ),
//             body: _buildInseminasiListView(controller),
//             floatingActionButton: Padding(
//               padding: const EdgeInsets.only(bottom: 16.0),
//               child: FloatingActionButton(
//                 onPressed: () {
//                   Get.toNamed(Routes.ADDINSEMINASI);
//                 },
//                 child: Icon(Icons.add),
//                 backgroundColor: Color(0xff132137),
//               ),
//             ),
//             floatingActionButtonLocation:
//                 FloatingActionButtonLocation.centerFloat,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInseminasiListView(InseminasiController controller) {
//     if (controller.posts == null) {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     } else if (controller.posts!.status == 200) {
//       if (controller.posts!.content!.isEmpty) {
//         return EmptyView();
//       } else {
//         return ListView.separated(
//           itemCount: controller.posts!.content!.length,
//           // shrinkWrap: true,
//           physics: BouncingScrollPhysics(),
//           separatorBuilder: (context, index) => SizedBox(height: 16),
//           itemBuilder: (context, index) {
//             var postData = controller.posts!.content![index];
//             return InkWell(
//               onTap: () => {
//                 Get.toNamed(
//                   Routes.DETAILINSEMINASI,
//                   arguments: {
//                     "detail_id_inseminasi": "${postData.idInseminasi}",
//                     "detail_eartag": "${postData.eartag}",
//                     "detail_id_hewan": "${postData.idHewan}",
//                     "detail_id_pembuatan": "${postData.idPembuatan}",
//                     "detail_id_pejantan": "${postData.idPejantan}",
//                     "detail_bangsa_pejantan": "${postData.bangsaPejantan}",
//                     "detail_ib1": "${postData.ib1}",
//                     "detail_ib2": "${postData.ib2}",
//                     "detail_ib3": "${postData.ib3}",
//                     "detail_iblain": "${postData.ibLain}",
//                     "detail_produsen": "${postData.produsen}",
//                     "detail_id_peternak": "${postData.idPeternak}",
//                     "detail_nama_peternak": "${postData.namaPeternak}",
//                     "detail_lokasi": "${postData.lokasi}",
//                     "detail_inseminator": "${postData.inseminator}",
//                     "detail_tanggal_ib": "${postData.tanggalIB}",
//                   },
//                 ),
//               },
//               borderRadius: BorderRadius.circular(8),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(
//                     width: 1,
//                     color: AppColor.primaryExtraSoft,
//                   ),
//                 ),
//                 padding:
//                     EdgeInsets.only(left: 24, top: 20, right: 29, bottom: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           (postData.status == null)
//                               ? "-"
//                               : "Id Kasus : ${postData.idInseminasi}",
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         Text((postData.status == null)
//                             ? "-"
//                             : "${postData.inseminator}"),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       }
//     } else {
//       return NoData();
//     }
//   }
// }