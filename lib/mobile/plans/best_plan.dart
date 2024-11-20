// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:tripso/mobile/screens/plans/select_date_screen.dart';
// import 'package:tripso/model/arg_model.dart';
// import 'package:tripso/model/city_model.dart';
// import 'package:tripso/model/place_model.dart';
// import 'package:tripso/shared/components/my_divider.dart';
// import 'package:tripso/shared/components/navigator.dart';
// import 'package:tripso/shared/components/sized_box.dart';
// import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
// import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
// import 'package:tripso/shared/styles/theme.dart';
//
// class BestPlan extends StatefulWidget {
//   const BestPlan({Key? key}) : super(key: key);
//   static const String routeName = 'BestPlan';
//
//   @override
//   State<BestPlan> createState() => _CreatePlanState();
// }
//
// class _CreatePlanState extends State<BestPlan> {
//   List<String> items = [
//     "1 Day",
//     "2 Days",
//     "3 Days",
//     "4 Days",
//   ];
//   int current = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<TripsoCubit, TripsoStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         ScreenArgs screenArgs =
//             ModalRoute.of(context)!.settings.arguments as ScreenArgs;
//         return SafeArea(
//           child: Scaffold(
//             body: Column(
//               children: [
//                 Space(height: 10.h, width: 0),
//                 SizedBox(
//                   height: 45,
//                   width: double.infinity,
//                   child: Row(
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           if (Navigator.canPop(context)) {
//                             pop(context);
//                           }
//                         },
//                         icon: Icon(
//                           Icons.arrow_back,
//                           size: 28.sp,
//                         ),
//                       ),
//                       Expanded(
//                         child: ListView.builder(
//                             physics: const BouncingScrollPhysics(),
//                             itemCount: items.length,
//                             scrollDirection: Axis.horizontal,
//                             itemBuilder: (ctx, index) {
//                               return GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     current = index;
//                                   });
//                                 },
//                                 child: AnimatedContainer(
//                                   duration: const Duration(microseconds: 300),
//                                   margin: const EdgeInsets.all(4).r,
//                                   width: 80.w,
//                                   height: 20.h,
//                                   decoration: BoxDecoration(
//                                     color: current == index
//                                         ? ThemeApp.primaryColor
//                                         : Colors.white,
//                                     borderRadius: current == index
//                                         ? BorderRadius.circular(8).r
//                                         : BorderRadius.circular(10).r,
//                                     border: current == index
//                                         ? Border.all(
//                                             color: ThemeApp.primaryColor,
//                                             width: 4.w,
//                                           )
//                                         : Border.all(
//                                             color: Colors.grey,
//                                             width: 1.w,
//                                           ),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       items[index],
//                                       style: GoogleFonts.roboto(
//                                         fontWeight: FontWeight.w500,
//                                         color: current == index
//                                             ? Colors.white
//                                             : Colors.grey,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             }),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const MyDivider(
//                   height: 0.5,
//                   color: Colors.black,
//                 ),
//                 PopularSightsWidget(
//                     cityModel: screenArgs.cityModel,
//                     placeModel: screenArgs.placeModel),
//                 Card(
//                   elevation: 6,
//                   color: ThemeApp.secondaryColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20).r,
//                   ),
//                   child: Container(
//                     padding: const EdgeInsets.all(8.0).r,
//                     clipBehavior: Clip.antiAliasWithSaveLayer,
//                     alignment: Alignment.center,
//                     width: double.infinity,
//                     height: 150.h,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           'assets/images/Group 66.png',
//                           width: 150.w,
//                           height: 200.h,
//                           fit: BoxFit.cover,
//                         ),
//                         Space(height: 0, width: 20.w),
//                         Expanded(
//                             child: Padding(
//                           padding: const EdgeInsets.all(8.0).r,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Text(
//                                 'Can\'t find what you\'re looking for? Create your plan from the start',
//                                 maxLines: 3,
//                                 style:
//                                     Theme.of(context).textTheme.headlineSmall,
//                               ),
//                               ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: ThemeApp.primaryColor,
//                                   ),
//                                   onPressed: () {
//                                     Navigator.pushNamed(
//                                       context,
//                                       SelectDateScreen.routeName,
//                                     );
//                                   },
//                                   child: const Text('Create'))
//                             ],
//                           ),
//                         ))
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
// class PopularSightsWidget extends StatelessWidget {
//   const PopularSightsWidget({
//     Key? key,
//     required this.cityModel,
//     required this.placeModel,
//   }) : super(key: key);
//
//   final CityModel cityModel;
//   final PlaceModel placeModel;
//
//   @override
//   Widget build(BuildContext context) {
//     var cubit = TripsoCubit.get(context);
//     return BlocConsumer<TripsoCubit, TripsoStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Expanded(child: ListViewWidget(cubit: cubit));
//       },
//     );
//   }
// }
//
// class ListViewWidget extends StatelessWidget {
//   const ListViewWidget({
//     Key? key,
//     required this.cubit,
//   }) : super(key: key);
//
//   final TripsoCubit cubit;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ListView.separated(
//           itemBuilder: (context, index) {
//             return GridSights(cubit.cityModel!, cubit.placeModel!);
//           },
//           separatorBuilder: (context, index) {
//             return Space(height: 10.h, width: 0.w);
//           },
//           itemCount: cubit.popularPlace.length,
//         ),
//       ],
//     );
//   }
// }
//
// class GridSights extends StatelessWidget {
//   const GridSights(
//     this.cityModel,
//     this.placeModel, {
//     Key? key,
//   }) : super(key: key);
//
//   final PlaceModel placeModel;
//   final CityModel cityModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(20),
//       onTap: () {},
//       child: Stack(
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//         children: [
//           Card(
//             elevation: 6,
//             color: ThemeApp.secondaryColor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20.r),
//             ),
//             child: Text(
//               'bestPLanModel.name.trim()',
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// // class PlansWidget extends StatelessWidget {
// //   const PlansWidget({
// //     Key? key,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     var cubit = TripsoCubit.get(context);
// //
// //     return BlocConsumer<TripsoCubit, TripsoStates>(
// //       listener: (context, state) {},
// //       builder: (context, state) {
// //         return SingleChildScrollView(
// //           child: Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
// //             child: Column(
// //               children: [
// //
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
//
// // class ListViewWidget extends StatelessWidget {
// //   const ListViewWidget({
// //     Key? key,
// //     required this.cubit,
// //   }) : super(key: key);
// //
// //   final TripsoCubit cubit;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Stack(
// //       children: [
// //         ListView.separated(
// //           physics: const NeverScrollableScrollPhysics(),
// //           shrinkWrap: true,
// //           itemBuilder: (context, index) {
// //             return const GridPlans();
// //           },
// //           separatorBuilder: (context, index) {
// //             return Space(height: 10.h, width: 0);
// //           },
// //           itemCount: TripsoCubit.get(context).bestPlan.length,
// //         ),
// //       ],
// //     );
// //   }
// //}
//
// // class BestPlan extends StatefulWidget {
// //   const BestPlan({Key? key}) : super(key: key);
// //   static const String routeName = 'BestPlan';
// //   @override
// //   State<BestPlan> createState() => _CreatePlanState();
// // }
// //
// //
// // class _CreatePlanState extends State<BestPlan> {
// //   List<String> items = [
// //     "1 Day",
// //     "2 Days",
// //     "3 Days",
// //     "4 Days",
// //   ];
// //   int current = 0;
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         body: Column(
// //           children: [
// //             Space(height: 10.h, width: 0),
// //             SizedBox(
// //               height: 45,
// //               width: double.infinity,
// //               child: Row(
// //                 children: [
// //                   IconButton(
// //                     onPressed: () {
// //                       if (Navigator.canPop(context)) {
// //                         pop(context);
// //                       }
// //                     },
// //                     icon:  Icon(
// //                       Icons.arrow_back,
// //                       size: 28.sp,
// //                     ),
// //                   ),
// //                   Expanded(
// //                     child: ListView.builder(
// //                         physics: const BouncingScrollPhysics(),
// //                         itemCount: items.length,
// //                         scrollDirection: Axis.horizontal,
// //                         itemBuilder: (ctx, index) {
// //                           return GestureDetector(
// //                             onTap: () {
// //                               setState(() {
// //                                 current = index;
// //                               });
// //                             },
// //                             child: AnimatedContainer(
// //                               duration: const Duration(microseconds: 300),
// //                               margin: const EdgeInsets.all(4).r,
// //                               width: 80.w,
// //                               height: 20.h,
// //                               decoration: BoxDecoration(
// //                                 color: current == index
// //                                     ? ThemeApp.primaryColor
// //                                     : Colors.white,
// //                                 borderRadius: current == index
// //                                     ? BorderRadius.circular(8).r
// //                                     : BorderRadius.circular(10).r,
// //                                 border: current == index
// //                                     ? Border.all(
// //                                   color: ThemeApp.primaryColor,
// //                                   width: 4.w,)
// //                                     : Border.all(
// //                                   color: Colors.grey,
// //                                   width: 1.w,
// //                                 ),),
// //                               child: Center(
// //                                 child: Text(
// //                                   items[index],
// //                                   style: GoogleFonts.roboto(
// //                                     fontWeight: FontWeight.w500,
// //                                     color: current == index
// //                                         ? Colors.white
// //                                         : Colors.grey,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                           );
// //                         }),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             const MyDivider(
// //               height: 0.5,
// //               color: Colors.black,),
// //             Expanded(
// //               child: SingleChildScrollView(
// //                 child: Column(
// //                   children: [
// //                     if (current == 0) const PlansWidget(),
// //                     if (current == 1) const PlansWidget(),
// //                     if (current == 2) const PlansWidget(),
// //                     if (current == 3) const PlansWidget(),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class PlansWidget extends StatelessWidget {
// //   const PlansWidget({
// //     Key? key,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     var cubit = TripsoCubit.get(context);
// //     return BlocConsumer<TripsoCubit, TripsoStates>(
// //       listener: (context, state) {},
// //       builder: (context, state) {
// //         return SingleChildScrollView(
// //           child: Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
// //             child: Column(
// //               children: [
// //                 ListViewWidget(cubit: cubit),
// //                 Card(
// //                   elevation: 6,
// //                   color: ThemeApp.secondaryColor,
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(20).r,
// //                   ),
// //                   child: Container(
// //                     padding: const EdgeInsets.all(8.0).r,
// //                     clipBehavior: Clip.antiAliasWithSaveLayer,
// //                     alignment: Alignment.center,
// //                     width: double.infinity,
// //                     height: 150.h,
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(20),
// //                     ),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         Image.asset(
// //                           'assets/images/Group 66.png',
// //                           width: 150.w,
// //                           height: 200.h,
// //                           fit: BoxFit.cover,
// //                         ),
// //                         Space(height: 0, width: 20.w),
// //                         Expanded(
// //                             child: Padding(
// //                               padding: const EdgeInsets.all(8.0).r,
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.end,
// //                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                                 children: [
// //                                   Text(
// //                                     'Can\'t find what you\'re looking for? Create your plan from the start',
// //                                     maxLines: 3,
// //                                     style: Theme.of(context).textTheme.headline6,
// //                                   ),
// //
// //                                   ElevatedButton(
// //                                       style: ElevatedButton.styleFrom(
// //                                         backgroundColor: ThemeApp.primaryColor,
// //                                       ),
// //                                       onPressed: () {
// //                                         Navigator.pushNamed(
// //                                           context,
// //                                           SelectDateScreen.routeName,
// //                                         );
// //                                       },
// //                                       child: const Text('Create'))
// //                                 ],
// //                               ),
// //                             ))
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
// //
// // class ListViewWidget extends StatelessWidget {
// //   const ListViewWidget({
// //     Key? key,
// //     required this.cubit,
// //   }) : super(key: key);
// //
// //   final TripsoCubit cubit;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Stack(
// //       children: [
// //         ListView.separated(
// //           physics: const NeverScrollableScrollPhysics(),
// //           shrinkWrap: true,
// //           itemBuilder: (context, index) {
// //             return const GridPlans();
// //           },
// //           separatorBuilder: (context, index) {
// //             return Space(height: 10.h, width: 0);
// //           },
// //           itemCount: 4,
// //         ),
// //       ],
// //     );
// //   }
// // }
// //
// // class GridPlans extends StatelessWidget {
// //   const GridPlans({
// //     Key? key,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell(
// //       borderRadius: BorderRadius.circular(20),
// //       onTap: () {},
// //       child: Card(
// //         elevation: 6,
// //         color: ThemeApp.secondaryColor,
// //         shape: RoundedRectangleBorder(
// //           borderRadius: BorderRadius.circular(20).r,
// //         ),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Stack(
// //               alignment: Alignment.bottomLeft,
// //               clipBehavior: Clip.antiAliasWithSaveLayer,
// //               children: [
// //                 ClipRRect(
// //                   borderRadius: BorderRadius.circular(20).r,
// //                   child: Image(
// //                     image: const NetworkImage(
// //                       'https://i.natgeofe.com/n/535f3cba-f8bb-4df2-b0c5-aaca16e9ff31/giza-plateau-pyramids.jpg',
// //                     ),
// //                     height: 150.h,
// //                     width: double.infinity,
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //                 LayerImage(
// //                   height: 150.h,
// //                   width: double.infinity,
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(
// //                     vertical: 20.0,
// //                     horizontal: 5,
// //                   ),
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.start,
// //                     crossAxisAlignment: CrossAxisAlignment.center,
// //                     children: [
// //                       Column(
// //                         crossAxisAlignment: CrossAxisAlignment.center,
// //                         children: [
// //                           IconButton(
// //                             onPressed: () {},
// //                             padding: const EdgeInsets.all(8),
// //                             icon: const Icon(
// //                               Icons.calendar_month,
// //                               size: 25,
// //                               color: Colors.white,
// //                             ),
// //                           ),
// //                           Text(
// //                             '3 Days',
// //                             textAlign: TextAlign.center,
// //                             style: GoogleFonts.roboto(
// //                               fontSize: 15,
// //                               fontWeight: FontWeight.w500,
// //                               color: Colors.white,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       const Space(height: 0, width: 10),
// //                       Column(
// //                         crossAxisAlignment: CrossAxisAlignment.center,
// //                         children: [
// //                           IconButton(
// //                             onPressed: () {},
// //                             padding: const EdgeInsets.all(8),
// //                             icon: const Icon(
// //                               Icons.remove_red_eye_outlined,
// //                               size: 25,
// //                               color: Colors.white,
// //                             ),
// //                           ),
// //                           Text(
// //                             '25 Sights',
// //                             textAlign: TextAlign.center,
// //                             style: GoogleFonts.roboto(
// //                               fontSize: 15,
// //                               fontWeight: FontWeight.w500,
// //                               color: Colors.white,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.all(8.0).r,
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(
// //                     'The Egyptian Museum',
// //                     maxLines: 1,
// //                     overflow: TextOverflow.ellipsis,
// //                     style: Theme.of(context).textTheme.headline3,
// //                   ),
// //                   Space(height: 2.h, width: 0),
// //                   Text(
// //                     'The Museum of Egyptian Antiquities, known commonly as the Egyptian Museum or the Cairo Museum, in Cairo, Egypt, is home to an extensive collection of ancient Egyptian antiquities. It has 120,000 items, with a representative amount on display and the remainder in storerooms. Built in 1901 by the Italian construction company, Garozzo-Zaffarani, to a design by the French architect Marcel Dourgnon, the edifice is one of the largest museums in the region. As of March 2019, the museum was open to the public. In 2022, the museum is due to be superseded by the newer and larger Grand Egyptian Museum at Giz',
// //                     maxLines: 5,
// //                     overflow: TextOverflow.ellipsis,
// //                     style: Theme.of(context)
// //                         .textTheme
// //                         .headline6
// //                         ?.copyWith(color: Colors.black54),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //}
