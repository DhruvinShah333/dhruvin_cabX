import 'package:CabX/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget getFeatureCard(
    {required double width,
    required String text,
    required String imagePath,
    required MainAxisAlignment alignment,
    String? icon}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.grey),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 10,
          offset: Offset(0, 5),
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 12, top: 12),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              color: blackColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: alignment,
          children: [
            Image(
              image: AssetImage(imagePath),
              width: width / 2,
            ),
            // if (icon != null)
            //   Image(
            //     image: AssetImage(icon),
            //     width: width / 2,
            //   ),
          ],
        ),
      ],
    ),
  );
}
