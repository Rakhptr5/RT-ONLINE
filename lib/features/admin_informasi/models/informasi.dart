import 'dart:convert';

import 'package:http/http.dart';

class Informasi {
  String categories_name;
  String description;
  String photo_url;
  String categories_id;
  String id;
  Informasi({
    required this.categories_name,
    required this.id,
    required this.description,
    required this.photo_url,
    required this.categories_id,
  });

  factory Informasi.fromJson(Map<String, dynamic> json) => Informasi(
      categories_name: json['categories_name'],
      categories_id: json['categories_id'],
      photo_url: json['photo_url'],
      description: json['description'],
      id: json['id']);
}
