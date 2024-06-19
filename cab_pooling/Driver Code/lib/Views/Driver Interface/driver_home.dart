import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secrets/Views/Driver%20Interface/bookings_section.dart';
import 'package:secrets/Views/Driver%20Interface/home_section.dart';
import 'package:secrets/Views/Driver%20Interface/notifications_section.dart';
import 'package:secrets/Views/Driver%20Interface/profile_section.dart';
import 'package:secrets/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  int _selectedTab = 0;

  final _pages = const [
    HomeSection(),
    NotificationSection(),
    Center(
      child: BookingSection(),
    ),
    UserSection(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _selectedTab == 1
          ? AppBar(
              title: Text(
              'Notifications',
              style: GoogleFonts.poppins(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ))
          : null,
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
          left: 16,
          right: 16,
        ),
        child: _pages[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: blueColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Alert"),
          BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number), label: "Tickets"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
