import 'package:CabX/Widgets/green_button.dart';
import 'package:CabX/Widgets/review_row.dart';
import 'package:CabX/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class InstantCabsReviewSheet extends StatelessWidget {
  Map<String, dynamic> cabDetails = {
    "Expected Price": "Rs 2000.00",
    "Travel Time": "1500 hr",
    "Pickup Point": "Kathmandu",
    "Pickup Time": "Now",
  };

  InstantCabsReviewSheet({super.key});
  final price = 2000;

  @override
  Widget build(BuildContext context) {
    final rows = List.from(
      cabDetails.entries.map(
        (e) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: getReviewRow(
            name: e.key,
            value: e.value.toString(),
          ),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Review Your Trip',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        ...rows,
        const SizedBox(
          height: 10,
        ),
        GreenButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, instantCabConfirmationPage, (route) {
              if (route.settings.name == homeRoute) {
                return true;
              }
              return false;
            });
          },
          title: 'Book Instant Cab',
        )
      ],
    );
  }
}
