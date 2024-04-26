import 'dart:convert';

import 'package:http/http.dart';

class HakAksess {
  String name;
  String id;
  HakAksess({
    required this.name,
    required this.id,
  });

  factory HakAksess.fromJson(Map<String, dynamic> json) =>
      HakAksess(name: json['name'], id: json['id']);
}
