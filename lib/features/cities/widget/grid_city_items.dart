part of '../../../core/helpers/export_manager/export_manager.dart';

class GridCitiesItem extends StatelessWidget {
  const GridCitiesItem({
    super.key,
    required this.cityModel,
  });

  final CityModel cityModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onCityTap(context),
      child: Card(
        clipBehavior: Clip.none,
        elevation: 1,
        color: ColorsManager.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20).r,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildImage(cityModel.image),
            _buildLayerImage(),
            _buildCityName(cityModel.name, context),
          ],
        ),
      ),
    );
  }

  // Function to handle onTap and navigate
  void _onCityTap(BuildContext context) {
    context.pushNamed(
      Routes.homeLayout,
      // arguments: cityModel, // Uncomment if you need to pass the city model.
    );
  }

  // Function to build the city image with CachedNetworkImage
  Widget _buildImage(String imageUrl) {
    return Container(
      width: 200.w,
      height: 210.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20).r,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20).r,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fitHeight,
          height: 200.h,
          width: double.infinity,
          errorWidget: (context, url, error) => Icon(
            Icons.info,
            size: 30.sp,
          ),
        ),
      ),
    );
  }

  // Function to build the layer image overlay
  Widget _buildLayerImage() {
    return LayerImage(
      width: 200.w,
      height: 210.h,
    );
  }

  // Function to display the city's name
  Widget _buildCityName(String cityName, BuildContext context) {
    return Text(
      cityName,
      style: context.headlineSmall?.copyWith(
        color: ColorsManager.whiteColor,
      ),
    );
  }
}
