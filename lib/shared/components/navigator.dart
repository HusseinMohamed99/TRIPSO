import 'package:flutter/material.dart';

class Routing {
  Route createRoute(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.1, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeOut;
        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}

void pop(BuildContext context) {
  Navigator.pop(context);
}

void navigateTo(
  BuildContext context, {
  required String routeName,
  Object? arguments,
}) {
  Navigator.pushNamed(context, routeName, arguments: arguments);
}

// void navigateToWithRouting(context, widget) {
//   Navigator.push(context, widget);
//   Navigator.push(context, Routing().createRoute(widget));
// }

void navigateAndFinish(
  BuildContext context, {
  required String routeName,
  Object? arguments,
}) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    routeName,
    arguments: arguments,
    (route) => false,
  );
}

// void navigateAndFinishWithRouting(context, widget) {
//   Navigator.pushAndRemoveUntil(context, Routing().createRoute(widget), (route) {
//     return false;
//   });
// }
