import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/styles/theme.dart';

class AllPlansScreen extends StatelessWidget {
  const AllPlansScreen({Key? key}) : super(key: key);
  static const String routeName = 'AllPlansScreen';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultTabController(
          length: 5,
          child: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 10.h,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  bottom: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 8).r,
                    indicator: BoxDecoration(
                        border: Border.all(
                            color: ThemeApp.secondaryColor, width: 2.w),
                        color: ThemeApp.primaryColor,
                        borderRadius: BorderRadius.circular(8.0).r),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(
                        text: 'Popular',
                      ),
                      Tab(
                        text: '1 Day',
                      ),
                      Tab(
                        text: '2 Day',
                      ),
                      Tab(
                        text: '3 Day',
                      ),
                      Tab(
                        text: '4 Day',
                      ),
                    ],
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: TabBarView(
                        children: [
                          const PlansWidget(),
                          Center(
                            child: Text(
                              '1 Day',
                              style: GoogleFonts.roboto(
                                fontSize: 40.sp,
                                fontWeight: FontWeight.w500,
                                color: ThemeApp.primaryColor,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '2 Day',
                              style: GoogleFonts.roboto(
                                fontSize: 40.sp,
                                fontWeight: FontWeight.w500,
                                color: ThemeApp.primaryColor,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '3 Day',
                              style: GoogleFonts.roboto(
                                fontSize: 40.sp,
                                fontWeight: FontWeight.w500,
                                color: ThemeApp.primaryColor,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '4 Day',
                              style: GoogleFonts.roboto(
                                fontSize: 40.sp,
                                fontWeight: FontWeight.w500,
                                color: ThemeApp.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}

class PlansWidget extends StatelessWidget {
  const PlansWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = TripsoCubit.get(context);
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
            child: Column(
              children: [
                ListViewWidget(cubit: cubit),
                Card(
                  elevation: 6,
                  color: ThemeApp.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20).r,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(8.0).r,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 150.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Group 66.png',
                          width: 150.w,
                          height: 200.h,
                          fit: BoxFit.cover,
                        ),
                        Space(height: 0, width: 20.w),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0).r,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Can\'t find what you\'re looking for? Create your plan from the start',
                                maxLines: 3,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        ThemeApp.primaryColor),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  onPressed: () {},
                                  child: const Text('Create'))
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final TripsoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const GridPlans();
          },
          separatorBuilder: (context, index) {
            return Space(height: 10.h, width: 0);
          },
          itemCount: cubit.place.length,
        ),
        Positioned(
            top: 10.h,
            left: 10.w,
            child: Card(
              elevation: 2,
              color: Colors.black.withOpacity(0.5),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: const StadiumBorder(
                  side: BorderSide(color: ThemeApp.secondaryColor)),
              child: IconButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    pop(context);
                  }
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: ThemeApp.secondaryColor,
                  size: 24.sp,
                ),
              ),
            )),
      ],
    );
  }
}

class GridPlans extends StatelessWidget {
  const GridPlans({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Card(
        elevation: 6,
        color: ThemeApp.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20).r,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20).r,
                  child: Image(
                    image: const NetworkImage(
                      'https://i.natgeofe.com/n/535f3cba-f8bb-4df2-b0c5-aaca16e9ff31/giza-plateau-pyramids.jpg',
                    ),
                    height: 150.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                LayerImage(
                  height: 150.h,
                  width: double.infinity,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The Egyptian Museum',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Space(height: 2.h, width: 0),
                  Text(
                    'The Museum of Egyptian Antiquities, known commonly as the Egyptian Museum or the Cairo Museum, in Cairo, Egypt, is home to an extensive collection of ancient Egyptian antiquities. It has 120,000 items, with a representative amount on display and the remainder in storerooms. Built in 1901 by the Italian construction company, Garozzo-Zaffarani, to a design by the French architect Marcel Dourgnon, the edifice is one of the largest museums in the region. As of March 2019, the museum was open to the public. In 2022, the museum is due to be superseded by the newer and larger Grand Egyptian Museum at Giz',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
