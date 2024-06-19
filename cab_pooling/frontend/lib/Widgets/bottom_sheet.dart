import 'package:CabX/Widgets/grabber.dart';
import 'package:CabX/constants/sheet_padding.dart';
import 'package:flutter/material.dart';


class ScrollableBottomSheet extends StatefulWidget {
  final double minSheetSize;
  final double maxSheetSize;
  final Widget? child;
  final bool dragable;

  const ScrollableBottomSheet({
    super.key,
    required this.minSheetSize,
    required this.maxSheetSize,
    this.child,
    this.dragable = false,
  });

  @override
  State<ScrollableBottomSheet> createState() => _ScrollableBottomSheetState();
}

class _ScrollableBottomSheetState extends State<ScrollableBottomSheet> {
  double sheetPosition = 0;

  @override
  void initState() {
    super.initState();
    sheetPosition = widget.maxSheetSize;
  }

  @override
  Widget build(BuildContext context) {
    double mid = (widget.minSheetSize + widget.maxSheetSize) / 2;
    return DraggableScrollableSheet(
      initialChildSize: sheetPosition,
      minChildSize: widget.minSheetSize,
      maxChildSize: widget.maxSheetSize,
      builder: (context, scrollController) {
        return GestureDetector(
          onVerticalDragUpdate: widget.dragable
              ? (DragUpdateDetails details) {
                  double dy = details.delta.dy / 600;
                  setState(() {
                    if (sheetPosition - dy > widget.minSheetSize &&
                        sheetPosition - dy < widget.maxSheetSize) {
                      sheetPosition -= dy;
                    }
                  });
                }
              : null,
          onVerticalDragEnd: widget.dragable
              ? (DragEndDetails details) {
                  if (sheetPosition < mid) {
                    setState(() {
                      sheetPosition = widget.minSheetSize;
                    });
                  } else {
                    setState(() {
                      sheetPosition = widget.maxSheetSize;
                    });
                  }
                }
              : null,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                const Grabber(),
                Flexible(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: sheetPadding),
                      child: widget.child,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
