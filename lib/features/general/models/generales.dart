class General {
  final List<GeneralData> list;
  final GeneralMeta meta;

  General({required this.list, required this.meta});

  factory General.fromJson(Map<String, dynamic> json) {
    return General(
      list: (json['list'] as List)
          .map((item) => GeneralData.fromJson(item))
          .toList(),
      meta: GeneralMeta.fromJson(json['meta']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'list': list.map((item) => item.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }
}

class GeneralData {
  final String id;
  int rt;
  int rw;
  final String address;
  final String province;
  final String city;
  final String district;
  final String postCode;
  final String responsiblePerson;
  final String phoneNumber;
  final Bank bank;
  final List<Structure> structure;

  GeneralData({
    required this.id,
    required this.rt,
    required this.rw,
    required this.address,
    required this.province,
    required this.city,
    required this.district,
    required this.postCode,
    required this.responsiblePerson,
    required this.phoneNumber,
    required this.bank,
    required this.structure,
  });

  factory GeneralData.fromJson(Map<String, dynamic> json) {
    return GeneralData(
      id: json['id'],
      rt: json['rt'],
      rw: json['rw'],
      address: json['address'],
      province: json['province'],
      city: json['city'],
      district: json['district'],
      postCode: json['post_code'],
      responsiblePerson: json['responsible_person'],
      phoneNumber: json['phone_number'],
      bank: Bank.fromJson(json['bank']),
      structure: (json['structure'] as List)
          .map((item) => Structure.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rt': rt,
      'rw': rw,
      'address': address,
      'province': province,
      'city': city,
      'district': district,
      'post_code': postCode,
      'responsible_person': responsiblePerson,
      'phone_number': phoneNumber,
      'bank': bank.toJson(),
      'structure': structure.map((item) => item.toJson()).toList(),
    };
  }
}

class Bank {
  final String id;
  final String name;
  final String noRek;
  final String holderName;

  Bank({
    required this.id,
    required this.name,
    required this.noRek,
    required this.holderName,
  });

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      id: json['id'],
      name: json['name'],
      noRek: json['no_rek'],
      holderName: json['holder_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'no_rek': noRek,
      'holder_name': holderName,
    };
  }
}

class Structure {
  final String id;
  final String position;
  final String citizenId;

  Structure({
    required this.id,
    required this.position,
    required this.citizenId,
  });

  factory Structure.fromJson(Map<String, dynamic> json) {
    return Structure(
      id: json['id'],
      position: json['position'],
      citizenId: json['citizen_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'position': position,
      'citizen_id': citizenId,
    };
  }
}

class GeneralMeta {
  final List<String> links;
  final int total;

  GeneralMeta({required this.links, required this.total});

  factory GeneralMeta.fromJson(Map<String, dynamic> json) {
    return GeneralMeta(
      links: List<String>.from(json['links']),
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'links': links,
      'total': total,
    };
  }
}
