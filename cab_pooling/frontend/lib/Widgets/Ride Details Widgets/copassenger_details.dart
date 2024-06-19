import 'package:CabX/Widgets/Ride%20Details%20Widgets/person_details_widget.dart';
import 'package:CabX/constants/colors.dart';
import 'package:CabX/data/CoPassengerDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CoPassengerDetailsWidget extends StatelessWidget {
  final List<CoPassengerData> passengers;

  const CoPassengerDetailsWidget({super.key, this.passengers = const []});

  @override
  Widget build(BuildContext context) {
    final passengerWidgets = passengers.map(
      (e) => PersonDetailsWidget(name: e.name, phoneNumber: e.phone),
    );
    int len = passengers.length;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Co-Passenger Details',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          len > 0
              ? Container(
                  width: 30,
                  height: 20,
                  decoration: BoxDecoration(
                    color: dartBlueShade,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '$len',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
      const SizedBox(
        height: 15,
      ),

      // List of Co-passenger details
      if (len > 0)
        ...passengerWidgets
      else
        const Column(
          children: [
            Center(
              child: Text(
                'No Co-Passenger pooled',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'You can pay the full price and book your own cab or cancel this ride',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: greyShade,
                ),
              ),
            ),
          ],
        ),
    ]);
  }
}
