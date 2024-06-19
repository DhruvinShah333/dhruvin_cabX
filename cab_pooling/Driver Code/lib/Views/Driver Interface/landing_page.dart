import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secrets/Widgets/green_button.dart';
import 'package:secrets/constants/colors.dart';
import 'package:secrets/constants/routes.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'CarPool',
          style: GoogleFonts.poppins(
            color: blackColor,
            fontWeight: FontWeight.w500,
            fontSize: 30,
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
            left: 30,
            // right: 30,
            bottom: 20),
        child: GreenButton(
          onPressed: () {
            Navigator.pushNamed(context, driverLogin);
          },
          bordeRadius: 20.0,
          title: 'Sign In',
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 40),
            Image.asset('assets/images/login_image1.png', height: 250),
            // const SizedBox(height: 20),
            Text(
              'Drive & Earn',
              style: GoogleFonts.urbanist(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    const Shadow(
                      color: greyShade,
                      offset: Offset(0, 0.5),
                      blurRadius: 4,
                    ),
                  ]),
            ),
            const SizedBox(height: 20),
            Text(
              'Earn extra cash on your own time by driving with CarPool. Connect with passengers, share rides, and boost your income.',
              textAlign: TextAlign.center,
              style: GoogleFonts.urbanist(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ])),
    );
  }
}
