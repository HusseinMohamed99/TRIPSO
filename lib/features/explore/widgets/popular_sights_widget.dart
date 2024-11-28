part of './../../../core/helpers/export_manager/export_manager.dart';

class PopularSightsWidget extends StatelessWidget {
  const PopularSightsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TripsoCubit>();
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {
        // Handle any state changes if necessary
      },
      builder: (context, state) {
        return Column(
          children: [
            _buildTitleSection(context),
            const Space(
                height: 16, width: 0), // Space between title and carousel
            _buildCarousel(cubit),
          ],
        );
      },
    );
  }

  // Title and See More Button Section
  Widget _buildTitleSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Popular Sights',
            style: context.titleMedium?.copyWith(
              fontWeight:
                  FontWeightHelper.semiBold, // Slightly heavier font weight
              color: ColorsManager.blackPrimary,
            ),
          ),
          _buildSeeMoreButton(context),
        ],
      ),
    );
  }

  // See More Button with subtle hover effect
  Widget _buildSeeMoreButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle the tap event to navigate to the Popular Sights screen
        // navigateTo(context, routeName: PopularSightsScreen.routeName, arguments: ...);
      },
      child: Row(
        children: [
          Text(
            'See More',
            style: context.labelLarge
                ?.copyWith(fontWeight: FontWeightHelper.semiBold),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 24.sp,
            color: ColorsManager.primaryColor,
          ),
        ],
      ),
    );
  }

  // Carousel Section with rounded corners and shadow effect
  Widget _buildCarousel(TripsoCubit cubit) {
    return CarouselSlider(
      items: List.generate(
        cubit.popularPlace.length,
        (index) => _buildCarouselItem(cubit, index),
      ),
      options: CarouselOptions(
        height: 227.h,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: 0.75, // Slightly larger fraction for better view
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }

  // Carousel item with a rounded card style
  Widget _buildCarouselItem(TripsoCubit cubit, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0), // Rounded corners
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8.0,
              offset: Offset(0, 4), // Subtle shadow effect
            ),
          ],
        ),
        child: GridItemSights(
          cubit.cityModel!,
          placeModel: cubit.popularPlace[index],
        ),
      ),
    );
  }
}
