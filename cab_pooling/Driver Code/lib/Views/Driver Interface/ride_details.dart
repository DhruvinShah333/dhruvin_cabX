import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secrets/Widgets/PersonGroupDetailsWidget.dart';
import 'package:secrets/Widgets/green_button.dart';
import 'package:secrets/Widgets/review_row.dart';
import 'package:secrets/constants/colors.dart';
import 'package:secrets/data/person_data.dart';

class RideDetailsView extends StatelessWidget {
  const RideDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PersonData> passengers = [
      PersonData(name: 'Angel Priya', phone: '+91-9876543210'),
      PersonData(name: 'Riya', phone: '+91-9876543210')
    ];
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Image(
                          image:
                              AssetImage('assets/images/ride_details_map.png')),
                      const SizedBox(height: 15),
                      const Text(
                        'Secunderabad Railway Station',
                        style: TextStyle(
                          color: blue1,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                      const SizedBox(height: 5),
                      getReviewRow(
                          name: 'From',
                          value: 'IIT Hyderabad',
                          valueColor: blue1,
                          headingColor: blue1),
                      const SizedBox(height: 5),
                      getReviewRow(
                          name: 'Time',
                          value: '12:00 PM',
                          valueColor: blue1,
                          headingColor: blue1),
                      const SizedBox(height: 5),
                      getReviewRow(
                          name: 'Date',
                          value: '12th May 2021',
                          valueColor: blue1,
                          headingColor: blue1),
                      const SizedBox(height: 5),
                      getReviewRow(
                        name: 'Travel Time',
                        value: '2 hr 30 min',
                        valueColor: blue1,
                        headingColor: blue1,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Price Details',
                        style: TextStyle(
                          color: blue1,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                      const SizedBox(height: 5),
                      getReviewRow(
                          name: 'Passengers',
                          value: '4',
                          valueColor: blue1,
                          headingColor: blue1),
                      const SizedBox(height: 5),
                      getReviewRow(
                          name: 'Amount',
                          value: 'Rs. 1400.00',
                          valueColor: blue1,
                          headingColor: blue1),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PersonGroupDetailsWidget(
                    people: passengers,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GreenButton(
                onPressed: () {},
                bordeRadius: 20.0,
                title: 'Start Ride',
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
