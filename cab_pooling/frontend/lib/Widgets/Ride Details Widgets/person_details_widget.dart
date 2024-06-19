import 'package:CabX/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonDetailsWidget extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String? image;
  const PersonDetailsWidget({
    super.key,
    required this.name,
    required this.phoneNumber,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        radius: 25,
        child: (image == null
            ? const Icon(
                Icons.person,
                size: 30,
                color: Colors.white,
              )
            : Image.asset(
                image!,
                fit: BoxFit.cover,
              )),
      ),
      title: Text(
        name,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Text(
        phoneNumber,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: greyShade,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Wrap(
        spacing: 12, // space between two icons
        children: <Widget>[
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.5),
              color: dartBlueShade,
            ),
            child: const Icon(
              Icons.call,
              color: Colors.white,
              size: 20,
            ),
          ),
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.5),
              color: dartBlueShade,
            ),
            child: const Icon(
              Icons.mail,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
