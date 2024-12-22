part of './../export_manager/export_manager.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.image,
    required this.imageHeight,
    this.imageWidth,
    this.fit,
  });
  final String image;
  final double imageHeight;
  final double? imageWidth;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: image,
          fit: fit ?? BoxFit.fitHeight,
          height: imageHeight.h,
          width: imageWidth ?? double.infinity,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: AdaptiveIndicator(),
          ),
          errorWidget: (context, url, error) => Center(
            child: AdaptiveIndicator(),
          ),
        ),
        LayerImage(
          height: imageHeight.h,
          width: imageWidth ?? double.infinity,
          borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(20).r,
            bottomRight: const Radius.circular(20).r,
          ),
        ),
      ],
    );
  }
}
