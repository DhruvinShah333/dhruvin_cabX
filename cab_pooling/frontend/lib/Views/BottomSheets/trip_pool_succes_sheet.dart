import 'package:CabX/Widgets/green_button.dart';
import 'package:CabX/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TripPoolSuccessSheet extends StatelessWidget {
  const TripPoolSuccessSheet({super.key});

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
          'Your Ride has been booked!',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Center(
        child: Text(
          'Disclaimer',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      Center(
        child: Text(
          '1. You will be notified of the pooling within 1 hr of departure.',
          style: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Center(
        child: Text(
          '2. If pooling is not done, you might have to pay the full amount mentioned.',
          style: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Center(
        child: Text(
          '3. If a driver could not be assigned, you  can contact your co-passengers and book your own ride',
          style: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(
        height: 40,
      ),
      GreenButton(
        onPressed: () async {
          Navigator.of(context).pushNamedAndRemoveUntil(rideDetails, (route) {
            print(route.settings.name);
            if (route.settings.name == homeRoute) return true;
            return false;
          });
        },
        title: 'Ride Details',
      ),
    ]);
  }
}
