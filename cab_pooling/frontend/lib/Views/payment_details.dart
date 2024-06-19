import 'package:CabX/Widgets/bordered_listile.dart';
import 'package:CabX/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PaymentDetailsPage extends StatefulWidget {
  const PaymentDetailsPage({super.key});

  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
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
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                BorderedListTile(
                  title: 'GPay',
                  subtitle: 'rajkumar@okicici',
                  leading: Image.asset('assets/images/gpay.png'),
                  onTap: () {
                    Navigator.of(context).pushNamed('/edit-payment');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                BorderedListTile(
                  title: 'Credit Card',
                  subtitle: 'xxxx-xxxx-xxxx-1234',
                  leading: Image.asset('assets/images/visa.png'),
                  onTap: () {
                    Navigator.of(context).pushNamed('/edit-payment');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
