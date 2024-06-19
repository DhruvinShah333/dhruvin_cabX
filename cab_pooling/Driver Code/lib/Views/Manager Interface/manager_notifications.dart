import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secrets/Widgets/manager_booking_card.dart';
import 'package:secrets/constants/colors.dart';
import 'package:secrets/constants/routes.dart';

class ManagerNotificationSection extends StatelessWidget {
  const ManagerNotificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Unread',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: greyShade,
          ),
        ),
        SingleChildScrollView(
          child: Column(children: [
            getManagerBookingCard(
              destination: 'IIT hyderabad',
              pickup: 'Secunderabad',
              time: DateTime.now(),
              driverName: 'ShyamJith',
              isNotification: true,
              requiredImage: false,
              onTap: () {
                Navigator.pushNamed(context, managerSizeRideDetailsView);
              },
            ),
          ]),
        ),
      ],
    );
  }
}
