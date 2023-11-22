import 'package:flutter/material.dart';

import 'package:go_sandwich/utils/navigation.dart';

typedef OnPressed = void Function();

Future<dynamic> showAlert({
  required BuildContext context,
  String? title,
  String? content,
  OnPressed? onPressed,
  bool? showCancelButton,
}) async {
  // show the dialog
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title != null ? Text(title) : const Text('Alert'),
        content: content != null ? Text(content) : const Text(''),
        actions: [
          if (showCancelButton == true)
            (TextButton(
                onPressed: () {
                  Navigation.back();
                },
                child: const Text('Batal'))),
          TextButton(
              onPressed: () {
                if (onPressed != null) {
                  onPressed();
                } else {
                  Navigation.back();
                }
              },
              child: const Text('OK'))
        ],
      );
    },
  );
}
