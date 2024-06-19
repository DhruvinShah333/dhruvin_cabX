import 'package:CabX/Widgets/green_button.dart';
import 'package:CabX/Widgets/input_with_heading.dart';
import 'package:CabX/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class EditPaymentPage extends StatefulWidget {
  const EditPaymentPage({super.key});

  @override
  State<EditPaymentPage> createState() => _EditPaymentPageState();
}

class _EditPaymentPageState extends State<EditPaymentPage> {
  late final TextEditingController detailController;

  @override
  void initState() {
    super.initState();
    detailController = TextEditingController(text: 'rajkumar@okicici');
  }

  @override
  void dispose() {
    detailController.dispose();
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
                'Payment Details',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputWithHeading(controller: detailController, name: 'GPay ID'),
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
                  title: 'Update',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
