import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CabX/constants/colors.dart';

Widget getBookingCard({
  required String destination,
  required String pickup,
  required DateTime time,
  required String imagePath,
  required Function() onTap,
}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    borderRadius: BorderRadius.circular(20),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 12, right: 12, top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image(image: AssetImage(imagePath)),
            const SizedBox(height: 15),
            Text(
              destination,
              style: const TextStyle(
                color: blackColor,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('From',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 10.0,
                      fontWeight: FontWeight.normal,
                    )),
                const SizedBox(width: 10),
                Text(pickup,
                    style: GoogleFonts.poppins(
                      color: blackColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                    )),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('12:00 PM',
                    style: GoogleFonts.poppins(
                      color: blackColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(width: 10),
                const Icon(Icons.arrow_forward_rounded,
                    color: blackColor, size: 24.0),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
