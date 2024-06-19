import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secrets/Widgets/manager_booking_card.dart';
import 'package:secrets/constants/colors.dart';
import 'package:secrets/constants/routes.dart';

class ManagerBookingsSection extends StatelessWidget {
  const ManagerBookingsSection({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upcoming Rides',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: greyShade,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                getManagerBookingCard(
                  destination: 'IIT hyderabad',
                  pickup: 'Secunderabad',
                  time: DateTime.now(),
                  driverName: 'ShyamJith',
                  onTap: () {
                    Navigator.pushNamed(context, managerSizeRideDetailsView);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                getManagerBookingCard(
                  destination: 'IIT hyderabad',
                  pickup: 'Secunderabad',
                  time: DateTime.now(),
                  driverName: 'ShyamJith',
                  onTap: () {
                    Navigator.pushNamed(context, managerSizeRideDetailsView);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                getManagerBookingCard(
                  destination: 'IIT hyderabad',
                  pickup: 'Secunderabad',
                  time: DateTime.now(),
                  driverName: 'ShyamJith',
                  onTap: () {
                    Navigator.pushNamed(context, managerSizeRideDetailsView);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
