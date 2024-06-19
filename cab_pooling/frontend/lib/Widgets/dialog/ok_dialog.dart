import 'package:CabX/Widgets/dialog/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showOkDialog({
  required BuildContext context,
  required String title,
  required String content,
}) async {
  await showGenericDialog<bool>(
    context: context,
    title: title,
    content: content,
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
