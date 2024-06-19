import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secrets/Widgets/driver_list_tile.dart';
import 'package:secrets/constants/colors.dart';
import 'package:secrets/constants/routes.dart';

class ManagerProfileSection extends StatefulWidget {
  const ManagerProfileSection({super.key});

  @override
  State<ManagerProfileSection> createState() => _ManagerProfileSectionState();
}

class _ManagerProfileSectionState extends State<ManagerProfileSection> {
  double rating = 3.6;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          const CircleAvatar(
            radius: 70,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/images/user.png'),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Baba Cars',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '${rating}',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: blackColor,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          RatingBar.builder(
            initialRating: rating,
            itemSize: 15,
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
            height: 30,
          ),
          Container(
            width: screenWidth - 32,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profile',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, editDriverProfile);
                          },
                          child: Image.asset('assets/images/edit_profile.png',
                              width: 20)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Name',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Dada Cars',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: blackColor,
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
                        'No. of Vehicles',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '4',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: blackColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
              width: screenWidth - 32,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Drivers',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const DriverListTile(),
                      const DriverListTile(),
                      const DriverListTile(),
                      const DriverListTile(),
                    ],
                  )))
        ],
      ),
    );
  }
}
