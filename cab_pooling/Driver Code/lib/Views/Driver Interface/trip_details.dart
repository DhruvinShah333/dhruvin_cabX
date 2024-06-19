import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secrets/Widgets/green_button.dart';
import 'package:secrets/Widgets/review_row.dart';
import 'package:secrets/constants/colors.dart';
import 'package:secrets/constants/routes.dart';

class TripDetails extends StatelessWidget {
  const TripDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Trip Details',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.fromBorderSide(
                  BorderSide(
                    color: Colors.black,
                    width: 0.5,
                  ),
                ),
              ),
              child: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/trip_details_map.png',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Secunderabad Railway Station',
                style: GoogleFonts.poppins(
                  color: blackColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              getReviewRow(name: 'From', value: 'IIT Hyderabad'),
              const SizedBox(height: 5),
              getReviewRow(name: 'Time', value: '12:00 PM'),
              const SizedBox(height: 5),
              getReviewRow(name: 'Date', value: '12th July 2021'),
              const SizedBox(height: 5),
              getReviewRow(name: 'Passengers', value: '4'),
              const SizedBox(height: 5),
              getReviewRow(name: 'Amount', value: 'Rs. 1400.45'),
              const SizedBox(height: 5),
              getReviewRow(name: 'Travel Time', value: '2 hr 30 min'),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GreenButton(
                      onPressed: () {
                        Navigator.pushNamed(context, rideDriverAccepted);
                      },
                      bordeRadius: 20,
                      title: 'Accept the Ride',
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
