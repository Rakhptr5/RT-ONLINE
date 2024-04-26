import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/admin_informasi/models/kategori.dart';
import 'package:venturo_core/features/hak_akses/controllers/hak_akses_controller.dart';
import 'package:venturo_core/features/hak_akses/models/hak_akses_model.dart';
import 'package:venturo_core/features/hak_akses/repositories/hak_akses_repository.dart';
import 'package:venturo_core/features/hak_akses/view/components/add_pengumuman.dart';
import 'package:venturo_core/features/hak_akses/view/components/edit_hak_akses.dart';
import 'package:venturo_core/features/hak_akses/view/components/top_bar_admin_pengumuman.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class HakAksesScreen extends StatefulWidget {
  @override
  _HakAksesScreenState createState() => _HakAksesScreenState();
}

class _HakAksesScreenState extends State<HakAksesScreen> {
  final HakAksesController hakAksesController = Get.put(HakAksesController());
  late Future<List<HakAksess>> hakAkses;

  @override
  void initState() {
    super.initState();
    hakAkses = getHak();
  }

  Future<void> _refreshData() async {
    setState(() {
      hakAkses = getHak();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF0F5),
      body: Column(
        children: [
          TopBarHakAkses(
            title: "Hak Akses",
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshData,
              child: FutureBuilder<List<HakAksess>>(
                future: hakAkses,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Tampilkan loading indicator jika future masih berjalan
                    return Padding(
                      padding: const EdgeInsets.only(top: 98.0),
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    // Tampilkan daftar kategori jika data sudah tersedia
                    return ListView.builder(
                      padding: EdgeInsets.only(top: 10),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: 23,
                                      child: Image.asset(
                                          'assets/images/person_outline.png')),
                                  10.horizontalSpace,
                                  Text(
                                    snapshot.data![index].name,
                                    style: NunitoTextStyle.fw600
                                        .copyWith(fontSize: 17),
                                  ),
                                  Spacer(),

                                  //BUTTON EDIT
                                  // HakAksesScreen.dart
                                  IconButton(
                                    onPressed: () async {
                                      Get.to(EditHakAksesPage(
                                        id: snapshot.data![index].id,
                                        name: snapshot.data![index].name,
                                      ));
                                    },
                                    icon: Container(
                                      height: 23,
                                      child:
                                          Image.asset('assets/images/edit.png'),
                                    ),
                                  ),

                                  IconButton(
                                    onPressed: () async {
                                      // Delete the item
                                      await hakAksesController.deleteHakAkses(
                                          snapshot.data![index].id);

                                      // After deletion, refresh the data
                                      _refreshData();
                                    },
                                    icon: Container(
                                      height: 23,
                                      child: Image.asset(
                                          'assets/images/trash_outline.png'),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 1.5,
                                width: 365,
                                color: const Color.fromARGB(255, 36, 36, 36),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    // Tampilkan pesan kesalahan jika terjadi kesalahan
                    return Text('Terjadi kesalahan: ${snapshot.error}');
                  } else {
                    // Kasus lainnya (contoh: future belum dimulai)
                    return Text('Menunggu...');
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
