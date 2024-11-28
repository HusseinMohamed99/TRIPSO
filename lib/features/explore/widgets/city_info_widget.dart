part of './../../../core/helpers/export_manager/export_manager.dart';

class CityInformationWidget extends StatelessWidget {
  const CityInformationWidget({
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
          fit: BoxFit.fitWidth,
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
