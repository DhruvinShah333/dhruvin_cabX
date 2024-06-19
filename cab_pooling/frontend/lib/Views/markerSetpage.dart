import 'package:CabX/Views/BottomSheets/search_sheet.dart';
import 'package:CabX/Widgets/location_input.dart';
import 'package:CabX/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer' as devtools;

class SetMarkerPage extends StatefulWidget {
  const SetMarkerPage({super.key});

  @override
  State<SetMarkerPage> createState() => _SetMarkerPageState();
}

class _SetMarkerPageState extends State<SetMarkerPage> {
  late final TextEditingController locationController;

  @override
  void initState() {
    super.initState();
    locationController = TextEditingController();
  }

  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    devtools.log('Screen width: $screenWidth');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shadowColor: blackColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: blackColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'Ride Details',
          style: GoogleFonts.poppins(
            color: blackColor,
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            locationInput(
                hintText: 'Start',
                controller: locationController,
                width: screenWidth - 2 * 16,
                icon: Icons.location_searching,
                onTap: () {}),
            const SearchSheet(),
          ])),
    );
  }
}
