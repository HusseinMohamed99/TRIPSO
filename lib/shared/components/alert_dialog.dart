// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'navigator.dart';
//
// Future<bool?> alertDialog({
//   required context,
//   required String title,
//   required String content,
//   required Function()? function,
// }) {
//   return showDialog(
//     context: context,
//     builder: (_) => AlertDialog(
//       title: Text(title),
//       titleTextStyle: GoogleFonts.roboto(
//           color: Colors.black.withOpacity(0.3),
//           fontSize: 24,
//           fontWeight: FontWeight.w700),
//       content: Text(
//         content,
//         textAlign: TextAlign.center,
//       ),
//       contentTextStyle: GoogleFonts.roboto(
//           color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () => pop(context),
//           child: const Text('Cancel'),
//         ),
//         TextButton(
//           onPressed: function,
//           child: const Text('OK'),
//         ),
//       ],
//       ),
//   );
// }
