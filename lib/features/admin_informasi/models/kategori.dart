import 'dart:convert';

import 'package:http/http.dart';

class KategoriInfo {
  String name;
  String id;
  KategoriInfo({
    required this.name,
    required this.id,
  });

  factory KategoriInfo.fromJson(Map<String, dynamic> json) =>
      KategoriInfo(name: json['name'], id: json['id']);
}
