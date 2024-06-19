import 'package:CabX/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// used at home section
Widget getPlaceCard(
    {required String placeName,
    required String time,
    required String imagePath,
    required double width}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.grey),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 10,
          offset: Offset(0, 5),
        )
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 12, right: 12, top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            placeName,
            style: const TextStyle(
              color: blackColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(time,
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 10.0,
                      fontWeight: FontWeight.normal,
                    )),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Image(
                  image: AssetImage(imagePath),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
