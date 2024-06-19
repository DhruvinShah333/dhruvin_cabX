import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secrets/Widgets/green_button.dart';
import 'package:secrets/Widgets/input_with_heading.dart';
import 'package:secrets/constants/routes.dart';

import '../../constants/colors.dart';

class DriverLogin extends StatefulWidget {
  const DriverLogin({super.key});

  @override
  State<DriverLogin> createState() => _DriverLoginState();
}

class _DriverLoginState extends State<DriverLogin> {
  late final TextEditingController passWordController;
  late final TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passWordController = TextEditingController();
  }

  @override
  void dispose() {
    passWordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shadowColor: blueColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: BackButton(onPressed: () {
            Navigator.of(context).pop();
          }),
        ),
        title: Text(
          'Sign In',
          style: GoogleFonts.urbanist(
            color: blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Enter Your Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputWithHeading(
                  controller: emailController,
                  name: 'Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                InputWithHeading(
                  controller: passWordController,
                  name: 'Phone',
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GreenButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(driverHome, (route) => false);
                  },
                  bordeRadius: 20,
                  title: 'Sign In',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
