class CoPassengerData {
  String name;
  String phone;

  CoPassengerData({
    required this.name,
    required this.phone,
  });

  factory CoPassengerData.fromJson(Map<String, dynamic> json) {
    return CoPassengerData(
      name: json['name'],
      phone: json['phone'],
    );
  }
}
