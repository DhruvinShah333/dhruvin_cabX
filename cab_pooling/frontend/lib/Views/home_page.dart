import 'package:CabX/Views/bookings_section.dart';
import 'package:CabX/Views/home_section.dart';
import 'package:CabX/Views/notification_section.dart';
import 'package:CabX/Views/user_section.dart';
import 'package:CabX/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  int _selectedTab = 0;

  final _pages = const [
    Center(
      child: HomeSection(),
    ),
    Center(
      child: NotificationSection(),
    ),
    Center(
      child: BookingSection(),
    ),
    Center(
      child: UserSection(),
    ),
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
      appBar: AppBar(
        shadowColor: blueColor,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Image(
            image: AssetImage("assets/images/logo.png"),
            height: 30,
          ),
        ),
        title: Text(
          getTitle(_selectedTab),
          style: GoogleFonts.poppins(
            color: blackColor,
            fontWeight: FontWeight.w500,
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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

  String getTitle(int index) {
    switch (index) {
      case 0:
        return "CabPool";
      case 1:
        return "Notifications";
      case 2:
        return "Bookings";
      default:
        return "Account";
    }
  }
}
