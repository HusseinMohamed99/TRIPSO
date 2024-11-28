import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/model/best_plan_model.dart';
import 'package:tripso/shared/components/layer.dart';

class TopPlanItem extends StatelessWidget {
  const TopPlanItem({
    super.key,
    required this.bestPLanModel,
  });

  final BestPLanModel bestPLanModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20).r,
      onTap: () async {
        // navigateTo(
        //   context,
        //   routeName: TopPlansScreen.routeName,
        //   arguments: ScreenArgs(

        //     bestPLanModel: bestPLanModel,
        //   ),
        // );
        // if (kDebugMode) {
        //   print(bestPLanModel.pId);
        // }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16).r,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: 200.h,
              width: 220.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  const Radius.circular(20).r,
                ),
                image: const DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage('assets/images/2021884.jpg'),
                ),
              ),
            ),
            LayerImage(
              height: 200.h,
              width: 220.w,
            ),
            Text(
              bestPLanModel.name,
              textAlign: TextAlign.center,
              style: context.titleLarge?.copyWith(
                color: ColorsManager.blackPrimary,
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
