import 'dart:convert';

import 'package:http/http.dart';
import 'package:venturo_core/features/data_blok/constants/data_blok_api_constant.dart';
import 'package:venturo_core/features/data_blok/view/components/data_blok_card.dart';

class DataBlokRepository {
  final _baseurl = 'https://rtonline-api.venturo.pro/api/v1/citizen';
  final _baseurl1 = 'https://rtonline-api.venturo.pro/api/v1/blocks';

  Future<List<DataBlokCard>> getData() async {
    final response = await get(Uri.parse(_baseurl));

    if (response.statusCode == 200) {
      Map<String, dynamic> it = jsonDecode(response.body);
      print(it['data']['list']);

      List<DataBlokCard> blog = List<DataBlokCard>.from(
          it['data']['list'].map((e) => DataBlokCard.fromJson(e)));
      return blog;
      // return [];
    } else {
      throw Exception('Failed to load data');
    }
  }
}
