import 'package:CabX/Widgets/dialog/ok_dialog.dart';
import 'package:CabX/constants/colors.dart';
import 'package:CabX/constants/routes.dart';
import 'package:CabX/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer' as devtools;

Widget googleSignInButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: OutlinedButton(
      onPressed: () async {
        try {
          AuthService().signInWithGoogle().then((value) {
            if (value)
              Navigator.pushReplacementNamed(context, homeRoute);
            else {
              showOkDialog(
                  context: context,
                  title: 'Google Sign In Error',
                  content: 'Please try signing in from IITH credentials.');
            }
          });
        } on PlatformException catch (e) {
          devtools.log('Error occurred ${e.message}', name: 'LoginScreen');
        }
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: const BorderSide(width: 1, color: black54),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/google_logo.png', height: 25.0),
            const SizedBox(
              width: 20,
            ),
            Text(
              'Continue with Google',
              style: GoogleFonts.urbanist(
                fontSize: 17,
                color: blackColor,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
