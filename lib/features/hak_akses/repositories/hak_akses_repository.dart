import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:venturo_core/features/hak_akses/constants/hak_akses_api_constant.dart';
import 'package:venturo_core/features/hak_akses/models/hak_akses_model.dart';

import 'package:http/http.dart' as http;

class HakAksesRepository {
  // URL endpoint untuk API penghapusan Hak Akses
  static const String _baseUrl = 'https://rtonline-api.venturo.pro/api/v1';
  static const String _deleteEndpoint = '$_baseUrl/roles';

  // Fungsi untuk menghapus Hak Akses dari API
  static Future<void> deleteHakAkses(String id) async {
    try {
      // Ubah URL string menjadi Uri object
      final url = Uri.parse('$_deleteEndpoint/$id');

      // Lakukan panggilan HTTP DELETE ke API
      final response = await http.delete(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // Periksa status code dari response
      if (response.statusCode == 200) {
        // Berhasil menghapus, tidak perlu melakukan apa-apa karena pembaruan daftar dihandle oleh controller
      } else {
        // Cetak respons body untuk membantu dalam pemecahan masalah
        print('Response body: ${response.body}');

        // Tangani kesalahan jika terjadi
        throw Exception(
            'Failed to delete Hak Akses. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Tangani kesalahan jaringan atau kesalahan lainnya jika terjadi
      print('Error deleting Hak Akses: $e');
      throw Exception('Failed to delete Hak Akses: $e');
    }
  }
}

Future<List<HakAksess>> getHak() async {
  final response =
      await get(Uri.parse("https://rtonline-api.venturo.pro/api/v1/roles"));
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    // Print response body to see its structure
    List<HakAksess> hakAkses = List<HakAksess>.from(
        jsonResponse['data']['list'].map((e) => HakAksess.fromJson(e)));
    //for (var k in jsonResponse) {
    //KategoriInfo kategori = KategoriInfo.fromJson(k);
    //kategoriInfo.add(kategori);
    //}
    return hakAkses;
  } else {
    throw Exception('Error wak');
  }
}

Future<Map<String, dynamic>> postHak(
  String name,
  List<String> access,
) async {
  try {
    print("Sending data: name=$name, access=$access");
    final response = await http.post(
        Uri.parse("https://rtonline-api.venturo.pro/api/v1/roles"),
        body: {
          "name": name,
          "access": access.join(','),
        });
    if (response.statusCode == 200) {
      print("Sending data: name=$name, access=$access");
      return json.decode(response.body);
    } else {
      print("API Error: ${response.body}");
      return {"error": "Failed to post data. Response: ${response.body}"};
    }
  } catch (e) {
    print(e.toString());
    return {"error": "Failed to post data. Error: ${e.toString()}"};
  }
}

Future<Map<String, dynamic>> putHak(
  String id,
  String name,
  List<String> access,
) async {
  try {
    print("Sending data: id=$id, name=$name, access=$access");
    final response = await http.put(
        Uri.parse('https://rtonline-api.venturo.pro/api/v1/roles'),
        body: {"name": name, "access": access.join(','), "id": id});
    if (response.statusCode == 200) {
      print("Data updated successfully: id=$id, name=$name, access=$access");
      return json.decode(response.body);
    } else {
      print("API Error: ${response.body}");
      return {"error": "Failed to update data. Response: ${response.body}"};
    }
  } catch (e) {
    print(e.toString());
    return {"error": "Failed to update data. Error: ${e.toString()}"};
  }
}
