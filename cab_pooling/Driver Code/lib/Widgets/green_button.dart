import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreenButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final double bordeRadius;
  const GreenButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.bordeRadius = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(bordeRadius),
          color: const Color.fromARGB(255, 18, 209, 142),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffadc8c1),
              spreadRadius: 4,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ]),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          onPressed();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 18, 209, 142),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 15,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(bordeRadius),
            ),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

