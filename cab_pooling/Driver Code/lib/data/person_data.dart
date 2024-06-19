class PersonData {
  String name;
  String phone;

  PersonData({
    required this.name,
    required this.phone,
  });

  factory PersonData.fromJson(Map<String, dynamic> json) {
    return PersonData(
      name: json['name'],
      phone: json['phone'],
    );
  }
}
