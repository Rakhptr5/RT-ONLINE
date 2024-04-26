import 'dart:convert';

import 'package:http/http.dart';

class Pengumumann {
  String title;
  String description;
  String photo_url;
  String created_at;
  Pengumumann({
    required this.title,
    required this.description,
    required this.created_at,
    required this.photo_url,
  });

  factory Pengumumann.fromJson(Map<String, dynamic> json) => Pengumumann(
        title: json['title'],
        description: json['description'],
        created_at: json['created_at'],
        photo_url: json['photo_url'],
      );
}

Future<List<Pengumumann>> getPengumuman() async {
  final response = await get(
      Uri.parse("https://rtonline-api.venturo.pro/api/v1/announcements"));
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    // Print response body to see its structure
    List<Pengumumann> pengumuman = List<Pengumumann>.from(
        jsonResponse['data']['list'].map((e) => Pengumumann.fromJson(e)));
    //for (var k in jsonResponse) {
    //KategoriInfo kategori = KategoriInfo.fromJson(k);
    //kategoriInfo.add(kategori);
    //}
    return pengumuman;
  } else {
    throw Exception('Error wak');
  }
}
