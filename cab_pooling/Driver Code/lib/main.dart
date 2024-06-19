import 'package:flutter/material.dart';
import 'package:secrets/Views/Driver%20Interface/driver-login.dart';
import 'package:secrets/Views/Driver%20Interface/driver_home.dart';
import 'package:secrets/Views/Driver%20Interface/landing_page.dart';
import 'package:secrets/Views/Driver%20Interface/ride_accepted.dart';
import 'package:secrets/Views/Driver%20Interface/ride_details.dart';
import 'package:secrets/Views/Driver%20Interface/splash_screen.dart';
import 'package:secrets/Views/Driver%20Interface/trip_details.dart';
import 'package:secrets/Views/Manager%20Interface/driver_details_view.dart';
import 'package:secrets/Views/Manager%20Interface/manager_home_page.dart';
import 'package:secrets/Views/Manager%20Interface/manager_ride_details.dart';
import 'package:secrets/constants/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
      title: 'CabPool',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        tripDriverDetails: (context) => const TripDetails(),
        rideDriverAccepted: (context) => const RideAccepted(),
        rideDriverDetails:(context) => const RideDetailsView(),
        driverHome: (context) => const HomePage(),
        driverLanding: (context) => const LandingPage(),
        driverLogin:(context) => const DriverLogin(),
        managerSideDriverDetailsView: (context) => const DriverDetailsView(),
        managerSizeRideDetailsView: (context) => const ManagerRideDetailsView(),
      }));
}
