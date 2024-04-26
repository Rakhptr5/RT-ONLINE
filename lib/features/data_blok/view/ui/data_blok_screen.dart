import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/data_blok/controllers/data_blok_controller.dart';

import 'package:venturo_core/features/data_blok/repositories/data_blok_repository.dart';
import 'package:venturo_core/features/data_blok/view/components/data_blok_card.dart';
import 'package:venturo_core/features/data_blok/view/components/header_data_blok.dart';

class DataBlokScreen extends StatefulWidget {
  DataBlokScreen({Key? key}) : super(key: key);

  @override
  _DataBlokScreenState createState() => _DataBlokScreenState();
}

class _DataBlokScreenState extends State<DataBlokScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<DataBlokCard> listWarga = [];
  List<dynamic> _blocks = [];
  Map<String, int> _totalPerBlock = {};
  DataBlokRepository repository = DataBlokRepository();
  String searchTerm = ''; // Tambahkan variabel searchTerm

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await _fetchBlocks();
    await _fetchWarga();
  }

  Future<void> _fetchBlocks() async {
    try {
      final response =
          await get(Uri.parse('http://rtonline-api.venturo.pro/api/v1/blocks'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        setState(() {
          _blocks = data['data']['list'];
          _tabController = TabController(length: _blocks.length, vsync: this);
        });
      } else {
        throw Exception('Failed to load blocks: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching blocks: $e');
    }
  }

  Future<void> _fetchWarga() async {
    try {
      List<DataBlokCard> newData = await repository.getData();
      newData.forEach((resident) {
        if (resident.blok != null) {
          String blockId = resident.blok!;
          if (_totalPerBlock.containsKey(blockId)) {
            _totalPerBlock[blockId] = _totalPerBlock[blockId]! + 1;
          } else {
            _totalPerBlock[blockId] = 1;
          }
        }
      });
      setState(() {
        listWarga = newData;
      });
    } catch (error) {
      print('Error fetching data: $error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to load data. Please try again later.'),
      ));
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF0F5),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 135.w,
              ),
              // Topbar
              const HeaderDataBlok(text: "Data Blok & No. Rumah"),

              // Search Bar
              Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 8,
                          offset: Offset(4, 3),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 0),
                      width: 358.w,
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            // Icon
                            const Icon(
                              Icons.search_rounded,
                            ),

                            // Divider
                            Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 6.w),
                              height: 25.w,
                              child: const VerticalDivider(
                                thickness: 1,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),

                            // Text Field
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    searchTerm = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: 'Cari Tetanggamu Disini',
                                  hintStyle: TextStyle(
                                    color: const Color(0xFFB5B7C4),
                                    fontSize: 14.sp,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          ),
          SizedBox(height: 24.w),
          _blocks.isNotEmpty ? _buildTabBar() : Container(),
          Expanded(
            child: _blocks.isNotEmpty ? _buildTabBarView() : Container(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 20, right: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              indicatorColor: Color(0xFF6454F0),
              labelColor: const Color(0xFF6454F0),
              unselectedLabelColor: const Color(0xFF9597A3),
              tabs: _blocks.map<Widget>((block) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Blok ${block['name']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(16),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${_totalPerBlock[block['id']] ?? 0} warga',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(10),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: _blocks.map<Widget>((block) {
        return ListView.builder(
          padding: EdgeInsets.only(top: 15),
          itemCount: listWarga.length,
          itemBuilder: (context, index) {
            // Filter data listWarga berdasarkan searchTerm
            bool shouldDisplay = listWarga[index]
                    .name
                    .toLowerCase()
                    .contains(searchTerm.toLowerCase()) ||
                (listWarga[index].blok != null &&
                    listWarga[index]
                        .blok!
                        .toLowerCase()
                        .contains(searchTerm.toLowerCase())) ||
                listWarga[index]
                    .phone_number
                    .toLowerCase()
                    .contains(searchTerm.toLowerCase());
            // Jika shouldDisplay true, tampilkan kartu data blok
            return shouldDisplay
                ? DataBlokCard(
                    name: listWarga[index].name,
                    blok: listWarga[index].blok,
                    phone_number: listWarga[index].phone_number,
                    photo_url: listWarga[index].photo_url,
                    date_of_birth: listWarga[index].date_of_birth,
                  )
                : Container(); // Jika tidak, tampilkan Container kosong
          },
        );
      }).toList(),
    );
  }
}
