import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secrets/Widgets/green_button.dart';
import 'package:secrets/constants/routes.dart';

class RideAccepted extends StatelessWidget {
  const RideAccepted({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GreenButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, rideDriverDetails, (route) {
                if (route.settings.name == '/') return true;
                return false;
              });
            },
            bordeRadius: 20.0,
            title: 'See Passenger Details',
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.15),
              Image.asset('assets/images/ride_accepted.png'),
              Text(
                'This Ride has been confirmed',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
