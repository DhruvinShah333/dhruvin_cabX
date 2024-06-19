import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secrets/Widgets/person_details_widget.dart';
import 'package:secrets/constants/colors.dart';
import 'package:secrets/data/person_data.dart';

class PersonGroupDetailsWidget extends StatelessWidget {
  final List<PersonData> people;
  final bool countRequired;
  final String heading;
  const PersonGroupDetailsWidget({
    super.key,
    this.people = const [],
    this.countRequired = true,
    this.heading = 'Passenger Details',
  });

  @override
  Widget build(BuildContext context) {
    final passengerWidgets = people.map(
      (e) => PersonDetailsWidget(
        name: e.name,
        phoneNumber: e.phone,
      ),
    );
    int len = people.length;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
                fontSize: 21, fontWeight: FontWeight.w500, color: blue1),
          ),
          const SizedBox(
            width: 10,
          ),
          len > 0 && countRequired
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
              height: 50,
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
