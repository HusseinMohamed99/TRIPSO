import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/my_divider.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';

class BestPlanDetailsScreen extends StatelessWidget {
  const BestPlanDetailsScreen(
      {super.key, required this.pId, required this.cId});

  final String pId;
  final String cId;

  @override
  Widget build(BuildContext context) {
    //  TripsoCubit.get(context).getDataPlaceForBestPlan(cId, pId);

    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var best = TripsoCubit.get(context).best;
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: const Radius.circular(20).r,
                      bottomLeft: const Radius.circular(20).r,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 300.h,
                              width: double.infinity,
                              child: CachedNetworkImage(
                                imageUrl: best!.image,
                                fit: BoxFit.fill,
                                height: 200.h,
                                width: double.infinity,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                  child: AdaptiveIndicator(),
                                ),
                                errorWidget: (context, url, error) => Center(
                                  child: AdaptiveIndicator(),
                                ),
                              ),
                            ),
                            LayerImage(
                              height: 300.h,
                              width: double.infinity,
                              borderRadius: BorderRadius.only(
                                bottomLeft: const Radius.circular(0).r,
                                bottomRight: const Radius.circular(0).r,
                              ),
                            ),
                            Positioned(
                              top: 15.h,
                              left: 20.w,
                              child: Card(
                                elevation: 2,
                                color:
                                    ColorsManager.blackPrimary.withOpacity(0.5),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const StadiumBorder(
                                  side: BorderSide(
                                    color: ColorsManager.whiteColor,
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: () async {
                                    if (Navigator.canPop(context)) {
                                      pop(context);
                                    }
                                    //  await flutterTts.pause();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    size: 24.sp,
                                    color: ColorsManager.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0).r,
                          child: Text(
                            best.name,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  color: ColorsManager.whiteColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0).r,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 8,
                                    ).r,
                                    margin: const EdgeInsets.all(8).r,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20).r,
                                      color: const Color.fromRGBO(
                                          255, 154, 3, 0.6),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Tickets :',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          best.tickets,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                color: ColorsManager.whiteColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Space(height: 0.h, width: 20.w),
                                // TextButton.icon(
                                //   onPressed: () {
                                //     speak(best.history);
                                //   },
                                //   icon: CircleAvatar(
                                //     backgroundColor: ThemeApp.primaryColor,
                                //     child: Icon(
                                //       FontAwesomeIcons.circlePlay,
                                //       size: 24.sp,
                                //       color: ThemeApp.secondaryColor,
                                //     ),
                                //   ),
                                //   label: const Text(''),
                                // ),
                                // TextButton.icon(
                                //   onPressed: () {
                                //     MapUtils.urlLauncher(
                                //       Uri.parse(
                                //         best.location.trim(),
                                //       ),
                                //     );
                                //   },
                                //   icon: CircleAvatar(
                                //     backgroundColor: ThemeApp.primaryColor,
                                //     child: Icon(
                                //       FontAwesomeIcons.locationArrow,
                                //       size: 24.sp,
                                //       color: ThemeApp.secondaryColor,
                                //     ),
                                //   ),
                                //   label: const Text(''),
                                // ),
                              ],
                            ),
                            MyDivider(
                              color: Colors.grey.shade200,
                            ),
                            Space(height: 10.h, width: 0.w),
                            ExpandableText(text: best.history),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0).r,
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.earthAmericas,
                                    size: 24.sp,
                                    color: ColorsManager.primaryColor,
                                  ),
                                  Space(height: 0.h, width: 20.w),
                                  Expanded(
                                    child: Text(
                                      best.address.trim(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              color:
                                                  ColorsManager.blackPrimary),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ExpansionTile(
                              tilePadding:
                                  const EdgeInsets.symmetric(horizontal: 8.0).r,
                              leading: Icon(
                                FontAwesomeIcons.clock,
                                color: ColorsManager.primaryColor,
                                size: 24.sp,
                              ),
                              title: Text(
                                'Open',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: ColorsManager.blackPrimary),
                              ),
                              children: [
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Saturday',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      Text(
                                        best.timeOfDay[0],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Sunday',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      Text(
                                        best.timeOfDay[1],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Monday',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      Text(
                                        best.timeOfDay[2],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Tuesday',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      Text(
                                        best.timeOfDay[3],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Wednesday',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      Text(
                                        best.timeOfDay[4],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Thursday',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      Text(
                                        best.timeOfDay[5],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Friday',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      Text(
                                        best.timeOfDay[6],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ExpandableText extends StatefulWidget {
  const ExpandableText({super.key, required this.text});

  final String text;

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AnimatedSize(
          duration: const Duration(milliseconds: 250),
          child: ConstrainedBox(
              constraints: expanded
                  ? const BoxConstraints()
                  : const BoxConstraints(maxHeight: 85),
              child: Text(
                widget.text,
                style: const TextStyle(fontSize: 18),
                overflow: TextOverflow.fade,
              ))),
      expanded
          ? OutlinedButton.icon(
              icon: const Icon(Icons.arrow_upward, color: Color(0xFFD50000)),
              label: const Text(
                'Close Text / Read Less',
                style: TextStyle(color: Color(0xFF2E7D32)),
              ),
              onPressed: () => setState(() => expanded = false))
          : OutlinedButton.icon(
              icon: const Icon(Icons.arrow_downward, color: Color(0xFFD50000)),
              label: const Text('Read More Here',
                  style: TextStyle(color: Color(0xFF2E7D32))),
              onPressed: () => setState(() => expanded = true))
    ]);
  }
}
