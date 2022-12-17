import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tripso/shared/components/sized_box.dart';

class MyDialog {
  static void showLoadingDialog(BuildContext context, String message,
      {bool isDismissible = true}) {
    showDialog(
      context: context,
      builder: (context) {
        if (Platform.operatingSystem == 'android') {
          return AlertDialog(
            content: Row(
              children: [
                const CircularProgressIndicator(),
                space(width: 15, height: 0),
                Text(message)
              ],
            ),
          );
        }

        return CupertinoAlertDialog(
          content: Row(
            children: [
              const CupertinoActivityIndicator(),
              space(width: 15, height: 0),
              Text(message),
            ],
          ),
        );
      },
      barrierDismissible: isDismissible,
    );
  }

  static void showMessage(
    BuildContext context,
    String message, {
    bool isDismissible = true,
    String? posActionTitle,
    VoidCallback? posAction,
    String? negActionTitle,
    VoidCallback? negAction,
  }) {
    List<Widget> actions = [];
    if (posActionTitle != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (posAction != null) {
              posAction();
            }
          },
          child: Text(posActionTitle)));
    }
    if (negActionTitle != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (negAction != null) {
              negAction();
            }
          },
          child: Text(negActionTitle)));
    }
    showDialog(
      context: context,
      builder: (context) {
        if (Platform.operatingSystem == 'android') {
          return AlertDialog(
            content: Text(message),
            actions: actions,
          );
        }

        return CupertinoAlertDialog(
          content: Text(message),
          actions: actions,
        );
      },
      barrierDismissible: false,
    );
  }

  static void hideDialog(context) {
    Navigator.pop(context);
  }
}
