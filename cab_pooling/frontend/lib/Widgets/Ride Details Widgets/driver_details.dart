import 'package:CabX/Widgets/Ride%20Details%20Widgets/person_details_widget.dart';
import 'package:CabX/Widgets/review_row.dart';
import 'package:CabX/constants/colors.dart';
import 'package:CabX/data/DriverDetails.dart';
import 'package:flutter/material.dart';


class DriverDetailsWidget extends StatelessWidget {
  final DriverDetails? driverDetails;
  const DriverDetailsWidget({super.key, this.driverDetails});

  @override
  Widget build(BuildContext context) {
    final widgets = getWidgets();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Driver Details',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ...widgets,
      ],
    );
  }

  List<Widget> getWidgets() {
    final widgets = driverDetails != null
        ? [
            PersonDetailsWidget(
                name: driverDetails!.name,
                phoneNumber: driverDetails!.phone,
                image: 'assets/images/user.png'),
            const SizedBox(
              height: 10,
            ),
            getReviewRow(
                name: 'Vehicle Number', value: driverDetails!.vehicleNumber),
            const SizedBox(
              height: 10,
            ),
            getReviewRow(
                name: 'Vehicle Make', value: driverDetails!.vehicleMake),
          ]
        : const [
            Center(
              child: Text(
                'No Driver assigned',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'You can contact pooled passengers and book your own cab',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: greyShade,
                ),
              ),
            ),
          ];

    return widgets;
  }
}
