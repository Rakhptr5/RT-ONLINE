import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:venturo_core/features/informasi/view/components/tatib_list.dart';
import 'package:venturo_core/features/informasi/view/components/top_bar_informasi.dart';
import 'package:venturo_core/features/informasi/view/ui/empty_tata_tertib_screen.dart';
import 'package:venturo_core/features/informasi/view/ui/tata_tertib_screen.dart';

class TataTertibListScreen extends StatefulWidget {
  const TataTertibListScreen({Key? key}) : super(key: key);

  @override
  _TataTertibListScreenState createState() => _TataTertibListScreenState();
}

class _TataTertibListScreenState extends State<TataTertibListScreen> {
  bool isEmpty = false;
  late Future<List<dynamic>> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = fetchData();
  }

  Future<List<dynamic>> fetchData() async {
    final response = await get(
        Uri.parse('http://rtonline-api.venturo.pro/api/v1/information'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data['data']['list'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff0f5),
      body: Column(
        children: [
          // Topbar
          const TopBarInformasi(),

          10.verticalSpace,

          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                // Panggil fungsi getInforr untuk memperbarui data
                setState(() {
                  _futureData = fetchData();
                });
              },
              child: FutureBuilder<List<dynamic>>(
                future: _futureData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final List<dynamic> dataList = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.only(top: 3),
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        final categoriesName =
                            dataList[index]['categories_name'];
                        final description = dataList[index]['description'];

                        return TatibCards(
                            onTap: () {
                              // Handle onTap event
                              Get.to(TataTertibScreen(
                                categoriesName: categoriesName,
                                description: description,
                              ));
                            },
                            categoriesName: categoriesName,
                            description: description);
                      },
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
