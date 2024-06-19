import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SearchSheet extends StatelessWidget {
  const SearchSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Search Results',
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Main Gate, IIT Hyderabad',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            subtitle: Text('Kandi, Telangana'),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
        ]),
      ),
    );
  }
}
