part of './../../../core/helpers/export_manager/export_manager.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetImages = [
      Image.asset(AssetPath.gizaImage),
      Image.asset(AssetPath.dubaiImage),
      Image.asset(AssetPath.tripsoImage),
      Image.asset(AssetPath.ancient1),
      Image.asset(AssetPath.ancient2),
      Image.asset(AssetPath.ancient3),
      Image.asset(AssetPath.ancient4),
      Image.asset(AssetPath.ancient5),
      Image.asset(AssetPath.ancient6),
    ];

    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        CarouselSlider(
          items: widgetImages,
          options: CarouselOptions(
            height: context.height * 0.36,
            enlargeCenterPage: false,
            viewportFraction: 2.0,
            autoPlay: true,
            autoPlayCurve: Curves.decelerate,
          ),
        ),
        LayerImage(
          height: context.height * 0.36,
          width: context.width,
          borderRadius: BorderRadius.circular(0),
        ),
        Positioned(
          bottom: 30.h,
          left: 15.w,
          right: 15.w,
          child: Text(
            "Let's plan your next adventure!",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.headlineSmall?.copyWith(
              color: ColorsManager.whiteColor,
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
        ),
        Positioned(
          top: 30.h,
          right: 15.w,
          child: IconButton(
            iconSize: 24.sp,
            style: IconButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: ColorsManager.primaryColor,
            ),
            onPressed: () {
              logOut(context);
            },
            icon: Icon(
              Icons.logout_outlined,
              color: ColorsManager.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
