import 'package:CabX/constants/colors.dart';
import 'package:flutter/material.dart';

Widget iconedButton({
  IconData? prefixIcon,
  required String text,
  IconData? suffixIcon,
  required Function() onPressed,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(40),
      border: Border.all(color: black54),
    ),
    child: InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // show only if prefixIcon is not null
            if (prefixIcon != null) Icon(prefixIcon, size: 18),
            const SizedBox(width: 10.0),
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 6.0),
            if (suffixIcon != null) Icon(suffixIcon),
          ],
        ),
      ),
    ),
  );
}
