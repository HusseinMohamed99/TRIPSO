import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/core/styles/asset_path.dart';
import 'package:tripso/features/plans/pick_plan.dart';
import 'package:tripso/shared/components/date_time.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({super.key});

  static const String routeName = 'SelectDateScreen';

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  DateTime? _firstDate;
  DateTime? _lastDate;

  int _numberOfDays() {
    if (_firstDate == null || _lastDate == null) {
      return 0;
    } else {
      return _lastDate!.difference(_firstDate!).inDays + 1;
    }
  }

  List<Widget> _buildDateCheckboxes() {
    List<Widget> checkboxes = [];
    for (int i = 0; i < _numberOfDays(); i++) {
      int index = i + 1;
      checkboxes.add(
        Padding(
          padding: const EdgeInsets.all(8.0).r,
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Day $index'),
                Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 24.sp,
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                PickPlans.routeName,
                arguments: NumOf(numOfDays: _numberOfDays(), index: index),
              );
              if (kDebugMode) {
                print(index);
              }
            },
          ),
        ),
      );
    }
    return checkboxes;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                pop(context);
              }
            },
            icon: Icon(
              Icons.arrow_back,
              size: 28.sp,
              color: ColorsManager.blackPrimary,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: ColorsManager.secondaryColor,
          title: Text(
            'Customize',
            style: GoogleFonts.roboto(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: ColorsManager.blackPrimary,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0).r,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0).r,
                child: Row(
                  children: [
                    Text(
                      'Starts on',
                      style: GoogleFonts.roboto(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Space(height: 0, width: 120.w),
                    Text(
                      'Ends on',
                      style: GoogleFonts.roboto(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10).r,
                      padding: const EdgeInsets.all(10).r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10).r,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: InkWell(
                        onTap: () async {
                          buildFirstDatePicker(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              _firstDate == null
                                  ? 'Select date'
                                  : DateTimeUtils.formatTasksDate(_firstDate),
                              style: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            Icon(
                              Icons.calendar_month,
                              size: 24.sp,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10).r,
                      padding: const EdgeInsets.all(10).r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10).r,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: InkWell(
                        onTap: () {
                          buildLastDatePicker(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              _lastDate == null
                                  ? 'Select date'
                                  : DateTimeUtils.formatTasksDate(_lastDate),
                              style: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            Icon(
                              Icons.calendar_month,
                              size: 24.sp,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Space(height: 16.h, width: 0),
              Text(
                'Number of Days: ${_numberOfDays()}',
                style: GoogleFonts.roboto(fontSize: 20.sp),
              ),
              if (_numberOfDays() >= 8)
                Padding(
                  padding: const EdgeInsets.only(top: 60.0).r,
                  child: Text(
                    'You Can Selected Only 7 Days',
                    style: GoogleFonts.roboto(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              _numberOfDays() == 0 || _numberOfDays() >= 8
                  ? Expanded(
                      child: Image.asset(AssetPath.imagesGroup92),
                    )
                  : Expanded(
                      child: ListView(
                        children: _buildDateCheckboxes(),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void buildLastDatePicker(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _firstDate ?? DateTime.now(),
      firstDate: _firstDate ?? DateTime.now(),
      lastDate: _firstDate?.add(const Duration(days: 6)) ??
          DateTime.now().add(const Duration(days: 60)),
    );
    if (selectedDate != null) {
      setState(() {
        _lastDate = selectedDate;
      });
    }
  }

  void buildFirstDatePicker(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _firstDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: _lastDate ?? DateTime.now().add(const Duration(days: 60)),
    );
    if (selectedDate != null) {
      setState(() {
        _firstDate = selectedDate;
      });
    }
  }
}

class NumOf {
  int numOfDays;
  int index;

  NumOf({required this.numOfDays, required this.index});
}
