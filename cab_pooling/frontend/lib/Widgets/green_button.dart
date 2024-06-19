import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final double bordeRadius;
  const GreenButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.bordeRadius = 40});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          onPressed();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 18, 209, 142),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 15,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(bordeRadius),
            ),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
