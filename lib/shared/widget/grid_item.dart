import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/mobile/screens/sights/sights.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/styles/colors.dart';

class GridItemSights extends StatelessWidget {
  const GridItemSights({Key? key}) : super(key: key);
  static const List<Icon> iconStar = [
    Icon(
      Icons.star,
      color: Colors.blue,
      size: 20,
    ),
    Icon(
      Icons.star,
      color: Colors.blue,
      size: 20,
    ),
    Icon(
      Icons.star,
      color: Colors.blue,
      size: 20,
    ),
    Icon(
      Icons.star,
      color: Colors.blue,
      size: 20,
    ),
    Icon(
      Icons.star,
      color: Colors.blue,
      size: 20,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        navigateTo(context, routeName: SightsScreen.routeName);
      },
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Card(
            elevation: 0,
            color: secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const Image(
                        image: AssetImage(
                          AssetPath.gizaImage,
                        ),
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const LayerImage(
                      height: 100,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The Giza Pyramids',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: iconStar,
                      ),
                      Text(
                        'One of the seven Wonders of the World: you can enter a 4,575 years old pyramid'
                            .trim(),
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 15,
            child: Column(
              children: [
                const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 26,
                ),
                Text(
                  '3 Days',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
