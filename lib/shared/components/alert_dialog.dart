import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navigator.dart';

Future<bool?> alertDialog({
  required context,
  required String title,
  required String content,
  required Function()? function,
}) {
  return showPlatformDialog(
      context: context,
      builder: (_) => PlatformAlertDialog(
            cupertino: (_, __) => CupertinoAlertDialogData(
              title: Text(title),
              content: Text(
                content,
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                PlatformDialogAction(
                  cupertino: (_, __) => CupertinoDialogActionData(
                    onPressed: () => pop(context),
                    child: const Text('Cancel'),
                  ),
                ),
                PlatformDialogAction(
                  cupertino: (_, __) => CupertinoDialogActionData(
                    onPressed: function,
                    child: const Text('OK'),
                  ),
                ),
              ],
            ),
            material: (_, __) => MaterialAlertDialogData(
              title: Text(title),
              titleTextStyle: GoogleFonts.roboto(
                  color: Colors.black.withOpacity(0.3),
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
              content: Text(
                content,
                textAlign: TextAlign.center,
              ),
              contentTextStyle: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
              actions: <Widget>[
                PlatformDialogAction(
                  material: (_, __) => MaterialDialogActionData(
                    onPressed: () => pop(context),
                    child: const Text('Cancel'),
                  ),
                ),
                PlatformDialogAction(
                  material: (_, __) => MaterialDialogActionData(
                    onPressed: function,
                    child: const Text('OK'),
                  ),

                ),
              ],
            ),
          ));
}
