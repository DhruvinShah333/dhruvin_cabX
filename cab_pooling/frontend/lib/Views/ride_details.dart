import 'package:CabX/Widgets/Ride%20Details%20Widgets/copassenger_details.dart';
import 'package:CabX/Widgets/Ride%20Details%20Widgets/driver_details.dart';
import 'package:CabX/Widgets/review_row.dart';
import 'package:CabX/constants/colors.dart';
import 'package:CabX/data/CoPassengerDetails.dart';
import 'package:CabX/data/DriverDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class RideDetails extends StatelessWidget {
  RideDetails({super.key});
  final List<CoPassengerData> passengers = [
    CoPassengerData(name: 'Angel Priya', phone: '+91-9876543210'),
    CoPassengerData(name: 'Riya', phone: '+91-9876543210')
  ];

  final DriverDetails? driverDetails = DriverDetails(
    name: 'Sunder Ramesh',
    phone: '+91-9876543210',
    vehicleNumber: 'TS 08 1234',
    vehicleMake: 'Innova Crysta',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shadowColor: blackColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: blackColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'Ride Details',
          style: GoogleFonts.poppins(
            color: blackColor,
            fontWeight: FontWeight.w500,
            fontSize: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'RGIA Hyderabad',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: blueShade),
                      ),
                      Text(
                        'pickup IIT Hyderabad',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: blueShade,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.share,
                    size: 24.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset(
                  'assets/images/ride_details_img.png',
                  width: double.infinity,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DriverDetailsWidget(
                driverDetails: driverDetails,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Trip Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              getReviewRow(name: 'Price', value: 'Rs. 2000'),
              const SizedBox(
                height: 18,
              ),
              getReviewRow(name: 'Start', value: 'RGIA Hyderabad'),
              const SizedBox(
                height: 10,
              ),
              getReviewRow(name: 'End', value: 'IIT Hyderabad'),
              const SizedBox(
                height: 18,
              ),
              getReviewRow(name: 'Date', value: '16th Jan 2024'),
              const SizedBox(
                height: 10,
              ),
              getReviewRow(name: 'Time', value: '11:54 AM'),
              const SizedBox(
                height: 15,
              ),
              CoPassengerDetailsWidget(
                passengers: passengers,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
