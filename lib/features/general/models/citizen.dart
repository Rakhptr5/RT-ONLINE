class Citizen {
  final String id;
  final String name;

  Citizen({
    required this.id,
    required this.name,
  });

  factory Citizen.fromJson(Map<String, dynamic> json) {
    return Citizen(
      id: json['id'],
      name: json['name'],
    );
  }
}
