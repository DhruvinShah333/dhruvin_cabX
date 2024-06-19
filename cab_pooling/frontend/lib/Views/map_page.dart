import 'package:CabX/Widgets/bottom_sheet.dart';
import 'package:CabX/constants/colors.dart';
import 'package:CabX/data/CabPoolRequest.dart';
import 'package:flutter/material.dart';
class MapPage extends StatefulWidget {
  final Widget? sheetContent;
  final bool dragable;
  final double maxSheetSize;
  const MapPage({
    super.key,
    this.sheetContent,
    required this.dragable,
    required this.maxSheetSize,
  });

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  CabPoolRequest cabPoolRequest = CabPoolRequest();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const Image(
            image: AssetImage('assets/images/cab_pooling/map.png'),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            top: screenHeight / 20,
            left: screenWidth / 20,
            child: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: blackColor,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  const CircleBorder(),
                ),
                maximumSize: MaterialStateProperty.all(const Size(40, 40)),
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight / 10,
            right: screenWidth / 10,
            child: IconButton(
              icon: const Icon(
                Icons.location_searching,
              ),
              onPressed: () {},
              color: blackColor,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  const CircleBorder(),
                ),
                maximumSize: MaterialStateProperty.all(const Size(40, 40)),
              ),
            ),
          ),
          ScrollableBottomSheet(
            minSheetSize: 36 / screenHeight,
            maxSheetSize: widget.maxSheetSize,
            dragable: widget.dragable,
            child: widget.sheetContent ?? const Placeholder(),
          ),
        ],
      ),
    );
  }
}
