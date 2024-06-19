import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BorderedListTile extends StatelessWidget {
  final Widget? leading;
  final String title;
  final String subtitle;
  final Widget trailing;
  final Function() onTap;
  const BorderedListTile({
    super.key,
    this.leading,
    required this.title,
    required this.subtitle,
    this.trailing = const Icon(Icons.arrow_forward_rounded,
        color: Color.fromARGB(255, 0, 0, 0), size: 24),
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.grey),
      ),
      leading: leading,
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.poppins(
          fontSize: 10,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
