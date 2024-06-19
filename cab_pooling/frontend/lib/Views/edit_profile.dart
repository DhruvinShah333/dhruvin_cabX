import 'package:CabX/Widgets/green_button.dart';
import 'package:CabX/Widgets/input_with_heading.dart';
import 'package:CabX/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: 'Emma Watson');
    emailController = TextEditingController(text: 'emmawatson@gmail.com');
    phoneController = TextEditingController(text: '1234567890');
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          'Account',
          style: GoogleFonts.poppins(
            color: blackColor,
            fontWeight: FontWeight.w500,
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                iconSize: 30,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Center(
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputWithHeading(
                  controller: nameController,
                  name: 'Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                InputWithHeading(
                  controller: emailController,
                  name: 'Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                InputWithHeading(
                  controller: phoneController,
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
                  onPressed: () {},
                  bordeRadius: 20,
                  title: 'Save Changes',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
