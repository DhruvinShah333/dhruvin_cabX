import 'package:CabX/constants/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginChildTwo extends StatelessWidget {
  const LoginChildTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 40),
          Image.asset('assets/images/login_image2.png', height: 250),
          // const SizedBox(height: 20),
          Text(
            'Instant Book',
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
            'Need a ride now? CarPool makes sharing a cab easy. Find rides instantly, book with a tap, and save money on your way!',
            textAlign: TextAlign.center,
            style: GoogleFonts.urbanist(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ]));
  }
}
