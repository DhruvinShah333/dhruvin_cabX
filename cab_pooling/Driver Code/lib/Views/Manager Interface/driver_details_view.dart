import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secrets/Widgets/manager_booking_card.dart';
import 'package:secrets/constants/colors.dart';
import 'package:secrets/constants/routes.dart';

class DriverDetailsView extends StatelessWidget {
  final rating = 3.5;
  const DriverDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Driver Details',
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
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Shyamjeet Vasudev',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '$rating',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              RatingBar.builder(
                initialRating: rating,
                itemSize: 13,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                allowHalfRating: true,
                ignoreGestures: true,
                unratedColor: Colors.amber.withAlpha(50),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 10.0,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.5),
                      color: dartBlueShade,
                    ),
                    child: const Icon(
                      Icons.call,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.5),
                      color: dartBlueShade,
                    ),
                    child: const Icon(
                      Icons.mail,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: screenWidth - 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Today\'s Statitistics',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: blue1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Amount',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: blue1,
                            ),
                          ),
                          Text(
                            'Rs. 12500.00',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: blue1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Distance Travelled',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: blue1,
                            ),
                          ),
                          Text(
                            '420 Km',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: blue1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Upcoming Rides',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: blue1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              getManagerBookingCard(
                destination: 'Secunderabad Railway Station',
                pickup: 'IIT Hyderabad',
                time: DateTime.now(),
                onTap: () {
                  Navigator.pushNamed(context, managerSizeRideDetailsView);
                },
                driverName: 'Shyamjeet Vasudev',
                requiredImage: false,
              ),
              const SizedBox(
                height: 10,
              ),
              getManagerBookingCard(
                destination: 'Secunderabad Railway Station',
                pickup: 'IIT Hyderabad',
                time: DateTime.now(),
                onTap: () {
                  Navigator.pushNamed(context, managerSizeRideDetailsView);
                },
                driverName: 'Shyamjeet Vasudev',
                requiredImage: false,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Past Rides',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: blue1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              getManagerBookingCard(
                destination: 'Secunderabad Railway Station',
                pickup: 'IIT Hyderabad',
                time: DateTime.now(),
                onTap: () {
                  Navigator.pushNamed(context, managerSizeRideDetailsView);
                },
                driverName: 'Shyamjeet Vasudev',
                requiredImage: false,
              ),
              const SizedBox(
                height: 10,
              ),
              getManagerBookingCard(
                destination: 'Secunderabad Railway Station',
                pickup: 'IIT Hyderabad',
                time: DateTime.now(),
                onTap: () {
                  Navigator.pushNamed(context, managerSizeRideDetailsView);
                },
                driverName: 'Shyamjeet Vasudev',
                requiredImage: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
