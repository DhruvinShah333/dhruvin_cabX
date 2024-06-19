import 'package:flutter/material.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function(); // this will show return values for differnt dialogs


// NULL return value is possible because android users may remove the dialog by pressing outside , return null
Future<T?> showGenericDialog<T>({required BuildContext context,
required String title, required String content,
required DialogOptionBuilder<T> optionsBuilder}) async {

  final options = optionsBuilder();
  return showDialog<T>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: options.keys
            .map((optionTitle){
              final optionValue = options[optionTitle];
              return TextButton(
                onPressed: () => optionValue != null ?Navigator.pop(context, optionValue): Navigator.pop(context),
                child: Text(optionTitle),
              );
            } )
            .toList(),
      );
    },
  );
}