import 'package:flutter/material.dart';

class Grabber extends StatelessWidget {
  const Grabber({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15.0),
          width: 36.0,
          height: 6.0,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}