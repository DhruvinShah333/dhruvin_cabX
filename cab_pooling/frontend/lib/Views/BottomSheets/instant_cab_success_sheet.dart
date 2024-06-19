import 'package:CabX/Widgets/green_button.dart';
import 'package:CabX/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstantCabSuccessSheet extends StatelessWidget {
  const InstantCabSuccessSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Congrats!',
        style: GoogleFonts.poppins(
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Center(child: Image.asset('assets/images/booked.png', width: 100)),
      const SizedBox(
        height: 22,
      ),
      Center(
        child: Text(
          'Your Ride has been Pooled!',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      GreenButton(
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(rideDetails, (route) {
            if (route.settings.name == homeRoute) {
              return true;
            }
            return false;
          });
        },
        title: 'Ride Details',
      ),
    ]);
  }
}
