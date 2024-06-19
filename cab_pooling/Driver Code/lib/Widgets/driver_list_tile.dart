import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secrets/constants/colors.dart';

class DriverListTile extends StatelessWidget {
  final void Function()? onTap;
  const DriverListTile({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(
        'assets/images/user.png',
        width: 50,
      ),
      title: Text(
        'Mrs. Sheetal M',
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: blue1,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        'TS 01 AB 1234',
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: greyColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: blue1,
      ),
      onTap: onTap,
    );
  }
}
