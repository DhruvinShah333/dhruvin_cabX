import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secrets/constants/colors.dart';

Widget getManagerBookingCard({
  required String destination,
  required String pickup,
  required DateTime time,
  required Function() onTap,
  required String driverName,
  bool requiredImage = true,
  bool isNotification = false,
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
            requiredImage
                ? const Image(
                    image: AssetImage('assets/images/booking_card_map.png'),
                  )
                : const SizedBox(),
            isNotification
                ? const Text(
                    'New Trip Accepted!',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : const SizedBox(),
            const SizedBox(height: 10),
            Text(
              destination,
              style: const TextStyle(
                color: blue1,
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
                      color: blackColor,
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                    )),
                const SizedBox(width: 10),
                Text(pickup,
                    style: GoogleFonts.poppins(
                      color: blue1,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                    )),
              ],
            ),
            const SizedBox(height: 5),
            const Text(
              '12:00 PM',
              style: TextStyle(
                color: blue1,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(driverName,
                    style: const TextStyle(
                      color: blue1,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: blue1,
                  size: 24.0,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
