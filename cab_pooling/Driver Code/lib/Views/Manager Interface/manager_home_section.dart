import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secrets/Widgets/driver_list_tile.dart';
import 'package:secrets/constants/colors.dart';
import 'package:secrets/constants/routes.dart';

class ManagerHomeSection extends StatefulWidget {
  const ManagerHomeSection({super.key});

  @override
  State<ManagerHomeSection> createState() => _ManagerHomeSectionState();
}

class _ManagerHomeSectionState extends State<ManagerHomeSection> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 30),
      ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(
          'assets/images/user.png',
          width: 60,
        ),
        title: Text(
          'Welcome',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w500, color: dartBlueShade),
        ),
        subtitle: Text(
          'Dada Cars',
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w600, color: blackColor),
        ),
        trailing: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: dartBlueShade,
          ),
          child: const Icon(
            Icons.notifications_none_outlined,
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        'Your Drivers',
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: blackColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      DriverListTile(
        onTap: () {
          Navigator.pushNamed(context, managerSideDriverDetailsView);
        },
      ),
      DriverListTile(
        onTap: () {
          Navigator.pushNamed(context, managerSideDriverDetailsView);
        },
      ),
      DriverListTile(
        onTap: () {
          Navigator.pushNamed(context, managerSideDriverDetailsView);
        },
      ),
      DriverListTile(
        onTap: () {
          Navigator.pushNamed(context, managerSideDriverDetailsView);
        },
      ),
    ]);
  }
}
