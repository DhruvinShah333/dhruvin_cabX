import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secrets/Widgets/bookings_card.dart';
import 'package:secrets/Widgets/heading_with_more.dart';
import 'package:secrets/constants/colors.dart';
import 'package:secrets/constants/routes.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  final int upcomingNum = 4;
  final int historyNum = 2;

  // Boolean flags to control visibility
  bool showUpcomingBookings = false;
  bool showHistoryBookings = false;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3 + upcomingNum + historyNum,
      itemBuilder: (context, index) {
        if (index == 0) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(
              'assets/images/user.png',
            ),
            title: Text(
              'Welcome',
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: dartBlueShade),
            ),
            subtitle: Text(
              'Shyamjeet',
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w600, color: blackColor),
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
          );
        } else if (index == 1) {
          return HeadingWithMore(
            count: upcomingNum,
            heading: 'Upcoming Rides',
            onPressed: () {
              setState(() {
                showUpcomingBookings = !showUpcomingBookings;
              });
            },
          );
        } else if (index == upcomingNum + 2) {
          return HeadingWithMore(
            count: historyNum,
            heading: 'Past Rides',
            onPressed: () {
              setState(() {
                showHistoryBookings = !showHistoryBookings;
              });
            },
          );
        } else if (index <= upcomingNum + 1) {
          return Visibility(
            visible: showUpcomingBookings || index == 2,
            child: getBookingCard(
                destination: 'Secunderabad Railway Station',
                pickup: 'IIT Hyderabad',
                time: DateTime(1969, 7, 20, 20, 18, 04),
                imagePath: 'assets/images/booking_card_map.png',
                onTap: () {
                  Navigator.pushNamed(context, tripDriverDetails);
                }),
          );
        } else {
          return Visibility(
            visible: showHistoryBookings || index == upcomingNum + 3,
            child: getBookingCard(
                destination: 'RGIA Hyderabad',
                pickup: 'IIT Hyderabad',
                time: DateTime(1969, 7, 20, 20, 18, 04),
                imagePath: 'assets/images/booking_card_map.png',
                onTap: () {
                  Navigator.pushNamed(context, tripDriverDetails);
                }),
          );
        }
      },
      separatorBuilder: (context, index) {
        if (index <= upcomingNum + 1 && showUpcomingBookings) {
          return const SizedBox(height: 10);
        }
        if (index <= upcomingNum + historyNum + 2 &&
            index >= upcomingNum + 3 &&
            showHistoryBookings) {
          return const SizedBox(height: 10);
        }

        if (!showUpcomingBookings && index == 2) {
          return const SizedBox(height: 10);
        }

        if (!showHistoryBookings && index == upcomingNum + 3) {
          return const SizedBox(height: 10);
        }
        return const SizedBox(height: 0);
      },
    );
  }
}
