import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/mobile/screens/plans/select_date_screen.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/styles/theme.dart';

class CreateCustomizePlan extends StatelessWidget {
  const CreateCustomizePlan({Key? key}) : super(key: key);
  static const String routeName = 'CreatePlan';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeApp.primaryColor,
          title: Text(
            'Customize Plan',
            style: GoogleFonts.roboto(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(child: Image.asset(AssetPath.plan)),
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
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ThemeApp.primaryColor,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  SelectDateScreen.routeName,
                                );
                              },
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
  }
}