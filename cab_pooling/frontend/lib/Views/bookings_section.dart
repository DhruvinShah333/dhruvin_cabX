import 'package:CabX/Widgets/bookings_card.dart';
import 'package:CabX/Widgets/heading_with_more.dart';
import 'package:CabX/constants/routes.dart';
import 'package:flutter/material.dart';

class BookingSection extends StatefulWidget {
  const BookingSection({super.key});

  @override
  State<BookingSection> createState() => _BookingSectionState();
}

class _BookingSectionState extends State<BookingSection> {
  final int _upcomingNum = 4;
  final int _historyNum = 2;

  // Boolean flags to control visibility
  bool _showUpcomingBookings = false;
  bool _showHistoryBookings = false;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 2 + _upcomingNum + _historyNum,
      itemBuilder: (context, index) {
        if (index == 0) {
          return HeadingWithMore(
            count: _upcomingNum,
            heading: 'Upcoming',
            onPressed: () {
              setState(() {
                _showUpcomingBookings = !_showUpcomingBookings;
              });
            },
          );
        } else if (index == _upcomingNum + 1) {
          return HeadingWithMore(
            count: _historyNum,
            heading: 'History',
            onPressed: () {
              setState(() {
                _showHistoryBookings = !_showHistoryBookings;
              });
            },
          );
        } else if (index <= _upcomingNum) {
          return Visibility(
            visible: _showUpcomingBookings || index == 1,
            child: getBookingCard(
                destination: 'Secunderabad Railway Station',
                pickup: 'IIT Hyderabad',
                time: DateTime(1969, 7, 20, 20, 18, 04),
                imagePath: 'assets/images/home_section/location.png',
                onTap: () {
                  Navigator.of(context).pushNamed(rideDetails);
                }),
          );
        } else {
          return Visibility(
            visible: _showHistoryBookings || index == _upcomingNum + 2,
            child: getBookingCard(
                destination: 'RGIA Hyderabad',
                pickup: 'IIT Hyderabad',
                time: DateTime(1969, 7, 20, 20, 18, 04),
                imagePath: 'assets/images/home_section/location.png',
                onTap: () {
                  Navigator.of(context).pushNamed(rideDetails);
                }),
          );
        }
      },
      separatorBuilder: (context, index) {
        if (index <= _upcomingNum && _showUpcomingBookings) {
          return const SizedBox(height: 10);
        }
        if (index <= _upcomingNum + _historyNum + 1 &&
            index >= _upcomingNum + 2 &&
            _showHistoryBookings) {
          return const SizedBox(height: 10);
        }

        if (!_showUpcomingBookings && index == 1) {
          return const SizedBox(height: 10);
        }

        if (!_showHistoryBookings && index == _upcomingNum + 2) {
          return const SizedBox(height: 10);
        }
        return const SizedBox(height: 0);
      },
    );
  }
}
