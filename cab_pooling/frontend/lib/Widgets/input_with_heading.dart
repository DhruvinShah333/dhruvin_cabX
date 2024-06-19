import 'package:flutter/material.dart';

class InputWithHeading extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  const InputWithHeading(
      {super.key, required this.controller, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
        TextField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
      ],
    );
  }
}
