import 'package:CabX/constants/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginChildOne extends StatelessWidget {
  const LoginChildOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 40),
          Image.asset('assets/images/login_image1.png', height: 250),
          // const SizedBox(height: 20),
          Text(
            'Pool Your Cab',
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
            'Carpool makes it easy to find people heading your way and book a shared ride.',
            textAlign: TextAlign.center,
            style: GoogleFonts.urbanist(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ]));
  }
}
