import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingWithMore extends StatelessWidget {
  final int count;
  final String heading;
  final Function() onPressed;
  const HeadingWithMore({
    super.key,
    required this.count,
    required this.heading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                heading,
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              Text(
                '$count',
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
