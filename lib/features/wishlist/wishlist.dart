import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/core/styles/asset_path.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/model/wishlist_model.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/show_toast.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});
  static const String routeName = 'WishList';

  @override
  Widget build(BuildContext context) {
    var tripsoCubit = TripsoCubit.get(context).cityModel;
    var cubit = TripsoCubit.get(context);
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {
        if (state is UnFavoriteSuccessState) {
          showToast(
            text: 'UnFavorite Successfully',
            state: ToastStates.success,
          );
        }
      },
      builder: (context, state) {
        if (cubit.wishList.isEmpty) {
          return Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 200.w,
                      height: 220.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18).r,
                        image: const DecorationImage(
                          image: AssetImage(AssetPath.emptyImage),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      'Your ${tripsoCubit!.name} WishList is Empty',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return ListView.separated(
          itemBuilder: (context, index) {
            return wishList(context, cubit.wishList[index], tripsoCubit!);
          },
          separatorBuilder: (context, index) {
            return Space(
              height: 10.h,
              width: 0,
            );
          },
          itemCount: cubit.wishList.length,
        );
      },
    );
  }

  Widget wishList(context, WishListModel wishListModel, CityModel cityModel) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(8).r,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10).r,
          ),
          elevation: 8,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10).r,
                border: Border.all(
                  color: ColorsManager.blackPrimary,
                )),
            width: double.infinity,
            height: 150.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(9),
                    topLeft: Radius.circular(9),
                  ).r,
                  child: SizedBox(
                    width: 150.w,
                    height: 150.h,
                    child: CachedNetworkImage(
                      imageUrl: wishListModel.wishListImage,
                      fit: BoxFit.cover,
                      height: 400.h,
                      width: double.infinity,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: AdaptiveIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        FontAwesomeIcons.info,
                        size: 24.sp,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0).r,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Text(
                                wishListModel.wishListName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19.sp,
                                ),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                splashRadius: 20.r,
                                padding: const EdgeInsets.only(right: 30).r,
                                onPressed: () {
                                  TripsoCubit.get(context)
                                      .deleteWishList(wishListModel.wishListId);
                                  TripsoCubit.get(context).getWishListData(
                                      cityModel.cId,
                                      TripsoCubit.get(context).userModel?.uId ??
                                          '');
                                },
                                icon: Icon(
                                  wishListModel.isWishList
                                      ? Icons.delete
                                      : Icons.add,
                                  color: ColorsManager.primaryColor,
                                  size: 24.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (wishListModel.wishListRate == '5')
                          Row(
                            children:
                                icon5Star(color: ColorsManager.primaryColor),
                          ),
                        if (wishListModel.wishListRate == '4.5')
                          Row(
                            children: icon4halfStar(
                                color: ColorsManager.primaryColor),
                          ),
                        if (wishListModel.wishListRate == '4')
                          Row(
                            children:
                                icon4Star(color: ColorsManager.primaryColor),
                          ),
                        if (wishListModel.wishListRate == '3.5')
                          Row(
                            children: icon3halfStar(
                                color: ColorsManager.primaryColor),
                          ),
                        if (wishListModel.wishListRate == '3')
                          Row(
                            children:
                                icon3Star(color: ColorsManager.primaryColor),
                          ),
                        if (wishListModel.wishListRate == '2.5')
                          Row(
                            children: icon2halfStar(
                                color: ColorsManager.primaryColor),
                          ),
                        if (wishListModel.wishListRate == '2')
                          Row(
                            children:
                                icon2Star(color: ColorsManager.primaryColor),
                          ),
                        if (wishListModel.wishListRate == '1.5')
                          Row(
                            children: icon1halfStar(
                                color: ColorsManager.primaryColor),
                          ),
                        if (wishListModel.wishListRate == '1')
                          Row(
                            children:
                                iconStar(color: ColorsManager.primaryColor),
                          ),
                        Space(
                          width: 0,
                          height: 5.h,
                        ),
                        Text(
                          wishListModel.wishListHistory,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.normal,
                            fontSize: 13.sp,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
