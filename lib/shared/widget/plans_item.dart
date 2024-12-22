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
    return GestureDetector(
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
                fit: BoxFit.fitWidth,
                image: NetworkImage(
                    'https://img.freepik.com/free-photo/marine-toys-sandy-beach_23-2148164591.jpg?t=st=1734873537~exp=1734877137~hmac=61b9412bfd2cbf5423c2d3f981854aba6b879d3aa2df024dce6ae71e3de7ed79&w=740'),
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
            style: context.titleSmall?.copyWith(
              color: ColorsManager.blackPrimary,
              fontWeight: FontWeightHelper
                  .semiBold, // Ensure FontWeightHelper is defined
            ),
          ),
        ],
      ).onlyPadding(
        leftPadding: 16,
        rightPadding: 16,
      ),
    );
  }
}
