class Iuran {
  Data data;
  String message;
  List<dynamic> settings;

  Iuran({
    required this.data,
    required this.message,
    required this.settings,
  });

  factory Iuran.fromJson(Map<String, dynamic> json) {
    return Iuran(
      data: Data.fromJson(json['data']),
      message: json['message'],
      settings: json['settings'],
    );
  }
}

class Data {
  List<ListElement> list;
  Meta meta;

  Data({
    required this.list,
    required this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      list: (json['list'] as List)
          .map((item) => ListElement.fromJson(item))
          .toList(),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class ListElement {
  String id;
  String? name; // Change the type to String?
  List<Detail> detail;
  int nominalDues;

  ListElement({
    required this.id,
    required this.name,
    required this.detail,
    required this.nominalDues,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) {
    return ListElement(
      id: json['id'],
      name: json['name'], // No need for casting to String?
      detail: (json['detail'] as List)
          .map((item) => Detail.fromJson(item))
          .toList(),
      nominalDues: json['nominal_dues'], // Update to match the JSON key
    );
  }
}

class Detail {
  String id;
  String duesId;
  String name;
  int nominal;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  int createdBy;
  int updatedBy;
  int deletedBy;

  Detail({
    required this.id,
    required this.duesId,
    required this.name,
    required this.nominal,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedBy,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      id: json['id'],
      duesId: json['duesId'],
      name: json['name'] as String,
      nominal: json['nominal'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
      deletedBy: json['deletedBy'],
    );
  }
}

class Meta {
  List<String> links;
  int total;

  Meta({
    required this.links,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      links: List<String>.from(json['links']),
      total: json['total'],
    );
  }
}

enum Name { IURAN_1, IURAN_2 }
