import 'package:CabX/enums/num_people.dart';
import 'package:CabX/enums/time_slot.dart';
import 'package:CabX/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class CabPoolRequest {
  TimeSlot timeSlot = TimeSlot.hour_1;
  NumPeople numpeople = NumPeople.one; // min people
  NumPeople num1 = NumPeople.one; // max people
  TimeOfDay time = TimeOfDay.now();
  DateTime date = DateTime.now();
  String start = "";
  String destination = "";

  CabPoolRequest({
    this.timeSlot = TimeSlot.hour_1,
    this.numpeople = NumPeople.one,
    this.num1 = NumPeople.one,
  });

  CabPoolRequest.fromJson(Map<String, dynamic> json) {
    timeSlot = json['timeSlot'];
    numpeople = json['numpeople'];
    num1 = json['num1'];
    time = json['time'];
    date = json['date'];
    start = json['start'];
    destination = json['destination'];
  }


  Map<String, dynamic> toJsonForRegister() {
    return {
      "email" : AuthService().currentUser!.email,
      "timeslot": "11 - 11:30" ,
      "zone" : "Airport",
      "numpeople": numpeople.value,
      "min" : numpeople.value,
      "max" : num1.value,
      "time": time.toString(),
      "date": date.toString(),
      "start": start,
      "destination": destination,
    };
  }
}
