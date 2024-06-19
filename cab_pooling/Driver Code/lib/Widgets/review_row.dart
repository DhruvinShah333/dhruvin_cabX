import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secrets/constants/colors.dart';

Widget getReviewRow(
    {required String name,
    required String value,
    Color? headingColor,
    Color? valueColor}) {
  return (Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        name,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: headingColor ?? const Color.fromARGB(255, 119, 113, 113),
        ),
      ),
      Text(
        value,
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: valueColor ?? blackColor,
        ),
      ),
    ],
  ));
}
