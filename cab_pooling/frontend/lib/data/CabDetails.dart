class CabDetails {
  int price;
  // ignore: non_constant_identifier_names
  String pickup_point, travel_time, slot;

  CabDetails(
      {required this.price,
      required this.pickup_point,
      required this.travel_time,
      required this.slot});

  factory CabDetails.fromJson(Map<String, dynamic> json) {
    return CabDetails(
      price: json['price'],
      pickup_point: json['pickup_point'],
      travel_time: json['travel_time'],
      slot: json['slot'],
    );
  }
}
