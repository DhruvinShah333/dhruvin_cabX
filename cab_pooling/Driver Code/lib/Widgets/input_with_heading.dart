import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secrets/constants/colors.dart';

class InputWithHeading extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final TextInputType inputType;
  const InputWithHeading(
      {super.key,
      required this.controller,
      required this.name,
      this.inputType = TextInputType.emailAddress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.urbanist(
            fontSize: 12,
            color: greyColor,
            fontWeight: FontWeight.w300,
          ),
        ),
        TextField(
          controller: controller,
          keyboardType: inputType,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
          ),
        ),
      ],
    );
  }
}
