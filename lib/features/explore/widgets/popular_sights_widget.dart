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
            BuildTitleSection(
              title: 'Popular Sights',
              onTap: () {
                // Handle the tap event to navigate
              },
            ),
            const Space(
                height: 16, width: 0), // Space between title and carousel
            _buildCarousel(cubit),
          ],
        );
      },
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
          placeModel: cubit.popularPlace[index],
        ),
      ),
    );
  }
}
