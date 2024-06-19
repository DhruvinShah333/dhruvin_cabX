import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secrets/Widgets/bookings_card.dart';
import 'package:secrets/constants/colors.dart';
import 'package:secrets/constants/routes.dart';

class NotificationSection extends StatelessWidget {
  const NotificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Unread',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: greyShade,
          ),
        ),
        SingleChildScrollView(
          child: Column(children: [
            getBookingCard(
              destination: 'IIT hyderabad',
              pickup: 'Secunderabad',
              time: DateTime.now(),
              onTap: () {
                Navigator.pushNamed(context, rideDriverDetails);
              },
            ),
          ]),
        ),
      ],
    );
  }
}
