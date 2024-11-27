part of './../../../core/helpers/export_manager/export_manager.dart';

class CityDetails extends StatelessWidget {
  const CityDetails({
    super.key,
    required this.tripsoCubit,
  });

  final TripsoCubit tripsoCubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: tripsoCubit.cityModel?.image ?? '',
          fit: BoxFit.fitHeight,
          height: context.height * 0.3,
          width: double.infinity,
          errorWidget: (context, url, error) => Icon(
            Icons.info,
            size: 24.sp,
          ),
        ),
        LayerImage(
          height: context.height * 0.3,
          width: double.infinity,
          borderRadius: BorderRadius.zero,
        ),
      ],
    );
  }
}
