import 'package:CabX/Widgets/bordered_listile.dart';
import 'package:CabX/constants/colors.dart';
import 'package:CabX/constants/routes.dart';
import 'package:CabX/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSection extends StatefulWidget {
  const UserSection({super.key});

  @override
  State<UserSection> createState() => _UserSectionState();
}

class _UserSectionState extends State<UserSection> {
  String? userName;
  String? displayImage;
  @override
  void initState() {
    super.initState();
    userName = AuthService().currentUser!.displayName!;
    displayImage = AuthService().currentUser!.photoUrl!;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         CircleAvatar(
          radius: 70,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(displayImage!),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          userName!,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          width: screenWidth - 32,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, editProfile);
                        },
                        child: Image.asset('assets/images/edit_profile.png',
                            width: 20)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      userName!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'College',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'IIT Hyderabad',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        BorderedListTile(
          title: 'Payment',
          subtitle: 'Change Your Payment Options',
          leading: const Icon(Icons.currency_rupee_rounded,
              color: Color.fromARGB(255, 0, 65, 245), size: 35.0),
          onTap: () {
            Navigator.pushNamed(context, paymentDetails);
          },
        ),
        const SizedBox(
          height: 10,
        ),
        BorderedListTile(
            title: 'Saved Addresses',
            subtitle: 'Edit and change the Saved addresses',
            leading: const Icon(Icons.settings_rounded,
                color: Color.fromARGB(255, 0, 65, 245), size: 35.0),
            onTap: () {}),
      ],
    );
  }
}
