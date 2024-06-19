import 'package:CabX/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomizedPopUpMenu<E> extends StatefulWidget {
  final String? text;
  final E value;
  final List<E> options;
  final Function(E) onOptionSelected;
  final Function(E) getLabel;
  final IconData? prefixIcon;
  const CustomizedPopUpMenu({
    super.key,
    required this.value,
    required this.options,
    required this.onOptionSelected,
    required this.getLabel,
    this.text,
    this.prefixIcon,
  });

  @override
  State<CustomizedPopUpMenu<E>> createState() => _CustomizedPopUpMenuState<E>();
}

class _CustomizedPopUpMenuState<E> extends State<CustomizedPopUpMenu<E>> {
  late IconData icon;

  @override
  void initState() {
    super.initState();
    icon = Icons.arrow_drop_down;
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: black54),
        ),
        child: InkWell(
          onTap: () => _showDropdownMenu(context: context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.prefixIcon != null)
                  Icon(
                    widget.prefixIcon,
                    size: 18,
                  ),
                if (widget.text != null)
                  Text(
                    widget.text!,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                const SizedBox(width: 8.0),
                Text(
                  widget.getLabel(widget.value),
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Icon(
                  icon,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDropdownMenu({required BuildContext context}) async {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    // increase the size of the dropdown menu by 10% of the button's width
    setState(() {
      icon = Icons.arrow_drop_up;
    });
    final E? selectedValue = await showMenu<E>(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy,
        offset.dx + renderBox.size.width,
        offset.dy + renderBox.size.height,
      ),
      items: widget.options.map((E option) {
        return PopupMenuItem<E>(
          value: option,
          child: Text(widget.getLabel(option)),
        );
      }).toList(),
    );

    if (selectedValue != null) {
      widget.onOptionSelected(selectedValue);
    }

    setState(() {
      icon = Icons.arrow_drop_down;
    });
  }
}
