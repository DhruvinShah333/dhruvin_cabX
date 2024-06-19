import 'package:CabX/Widgets/heading_with_more.dart';
import 'package:CabX/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationSection extends StatefulWidget {
  const NotificationSection({super.key});

  @override
  State<NotificationSection> createState() => _NotificationSectionState();
}

class _NotificationSectionState extends State<NotificationSection> {
  final int _unreadNum = 4;
  final int _readNum = 2;

  // Boolean flags to control visibility
  bool _showUnreadNotifications = false;
  bool _showReadNotifications = false;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 2 + _unreadNum + _readNum,
      itemBuilder: (context, index) {
        if (index == 0) {
          return HeadingWithMore(
            count: _unreadNum,
            heading: 'Unread',
            onPressed: () {
              setState(() {
                _showUnreadNotifications = !_showUnreadNotifications;
              });
            },
          );
        } else if (index == _unreadNum + 1) {
          return HeadingWithMore(
            count: _readNum,
            heading: 'Read',
            onPressed: () {
              setState(() {
                _showReadNotifications = !_showReadNotifications;
              });
            },
          );
        } else if (index <= _unreadNum) {
          final title = index == 1
              ? 'Ride to RGIA Hyderabad Confirmed! Connect with Co-Passengers Now.'
              : 'Ride Not Pooled. Please Pay Full Amount or Cancel Ride.';

          return Visibility(
              visible: _showUnreadNotifications || index == 1,
              child: NotificationWidget(title: title));
        } else {
          const title =
              'Sorry, no driver could be found. You can still call your pool mates and book your own cab!';

          return Visibility(
              visible: _showReadNotifications || index == _unreadNum + 2,
              child: NotificationWidget(title: title));
        }
      },
      separatorBuilder: (context, index) {
        if (index <= _unreadNum && _showUnreadNotifications) {
          return const SizedBox(height: 10);
        }
        if (index <= _unreadNum + _readNum + 1 &&
            index >= _unreadNum + 2 &&
            _showReadNotifications) {
          return const SizedBox(height: 10);
        }

        if (!_showUnreadNotifications && index == 1) {
          return const SizedBox(height: 10);
        }

        if (!_showReadNotifications && index == _unreadNum + 2) {
          return const SizedBox(height: 10);
        }
        return const SizedBox(height: 0);
      },
    );
  }
}

Widget NotificationWidget({required String title}) {
  return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: black26),
      ),
      leading: Image.asset(
        'assets/images/home_section/notification_prefix.png',
      ),
      title: Text(title),
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: blackColor,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: blackColor,
        size: 20,
      ));
}
