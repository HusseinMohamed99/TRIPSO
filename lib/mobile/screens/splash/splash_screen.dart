// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:tripso/mobile/screens/home/home_screen.dart';
// import 'package:tripso/mobile/screens/on_boarding/on_boarding_screen.dart';
// import 'package:tripso/shared/components/app_bar.dart';
// import 'package:tripso/shared/components/navigator.dart';
// import 'package:tripso/shared/components/size_config.dart';
// import 'package:tripso/shared/constants/constants.dart';
// import 'package:tripso/shared/styles/asset_path.dart';
// import 'package:tripso/shared/styles/colors.dart';
//
// class SplashScreen extends StatelessWidget {
//   static const String routeName = 'splash_screen';
//
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: secondaryColor,
//       body: SplashScreenBody(),
//     );
//   }
// }
//
// class SplashScreenBody extends StatefulWidget {
//   const SplashScreenBody({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreenBody> createState() => _SplashScreenBodyState();
// }
//
// class _SplashScreenBodyState extends State<SplashScreenBody>
//     with SingleTickerProviderStateMixin {
//   AnimationController? animationController;
//   Animation<double>? fadingAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     animationController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//     fadingAnimation =
//         Tween<double>(begin: 0.1, end: 1).animate(animationController!);
//
//     animationController?.repeat(reverse: true);
//
//     goToNextView();
//   }
//
//   @override
//   void dispose() {
//     animationController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Container(
//       constraints: const BoxConstraints.expand(),
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(AssetPath.splashImage),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: primaryAppBar(),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             FadeTransition(
//               opacity: fadingAnimation!,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'TRI',
//                     style: GoogleFonts.pacifico(
//                       textStyle: const TextStyle(
//                         color: primaryColor,
//                         fontSize: 45,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     'PSO',
//                     style: GoogleFonts.pacifico(
//                       textStyle: const TextStyle(
//                         color: secondaryColor,
//                         fontSize: 45,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void goToNextView() {
//     Widget widget;
//     Future.delayed(const Duration(seconds: 2), () {
//       if (uId != null) {
//         widget = const HomeScreen();
//       } else {
//         widget = const OnBoard();
//       }
//       navigateAndFinishWithRouting(context, widget);
//     });
//   }
// }
