import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/styles/theme.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);
  static const String routeName = 'WishList';

  @override
  Widget build(BuildContext context) {
    var tripsoCubit = TripsoCubit.get(context).cityModel;
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Center(
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
                'Your ${tripsoCubit!.name} is Empty',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget wishList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Space(
            height: 30,
            width: 0,
          );
        },
        itemCount: 8,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 8,
                child: Container(
                  width: 400,
                  height: 170,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const Image(
                          width: 150,
                          height: 170,
                          image: NetworkImage(
                              'https://cdn.britannica.com/06/122506-050-C8E03A8A/Pyramid-of-Khafre-Giza-Egypt.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Space(
                        height: 0,
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: ThemeApp.primaryColor,
                                  )),
                            ),
                            Text(
                              'The Great Pyramids',
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const Space(
                              width: 0,
                              height: 5,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: ThemeApp.primaryColor,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: ThemeApp.primaryColor,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: ThemeApp.primaryColor,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: ThemeApp.primaryColor,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: ThemeApp.primaryColor,
                                ),
                              ],
                            ),
                            const Space(
                              width: 0,
                              height: 5,
                            ),
                            Text(
                              'one of the seven wonders of the world, enter a 4,575 year old pyramid',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}