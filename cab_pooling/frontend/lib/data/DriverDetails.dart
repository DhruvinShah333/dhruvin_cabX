class DriverDetails {
  String name;
  String phone;
  String vehicleMake;
  String vehicleNumber;

  DriverDetails({
    required this.name,
    required this.phone,
    required this.vehicleMake,
    required this.vehicleNumber,
  });

  factory DriverDetails.fromJson(Map<String, dynamic> json) {
    return DriverDetails(
      name: json['name'],
      phone: json['phone'],
      vehicleMake: json['vehicle_make'],
      vehicleNumber: json['vehicle_number'],
    );
  }
}
