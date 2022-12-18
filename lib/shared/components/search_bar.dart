import 'package:flutter/material.dart';
import 'package:tripso/shared/styles/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    required this.function,
    this.width,
    this.title,
    this.iconSize,
    this.iconColor,
    this.titleColor,
    this.titleSize,
    this.styleColor,
    this.fontWeightTitle,
    this.iconData,
    this.readOnly,
    this.height,
    Key? key,
  }) : super(key: key);

  final bool? readOnly;
  final Function function;
  final String? title;
  final Icon? iconData;
  final Color? titleColor;
  final Color? iconColor;
  final Color? styleColor;
  final double? iconSize;
  final double? titleSize;
  final FontWeight? fontWeightTitle;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 40,
        width: width ?? 294,
        child: TextFormField(
          readOnly: readOnly == false,
          style: TextStyle(color: styleColor ?? Colors.black),
          onTap: () => function(),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: styleColor ?? secondaryColor),
            ),
            filled: true,
            fillColor: secondaryColor,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: styleColor ?? secondaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: styleColor ?? secondaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: styleColor ?? secondaryColor),
            ),
            hintText: title ?? 'Search',
            hintStyle: TextStyle(
                fontSize: titleSize ?? 15,
                color: titleColor ?? Colors.grey,
                fontWeight: fontWeightTitle ?? FontWeight.w500),
            prefixIcon: iconData ??
                Icon(
                  Icons.search,
                  color: iconColor ?? Colors.black,
                  size: iconSize ?? 24,
                ),
          ),
        ),
      ),
    );
  }
}

// Widget searchBar({
//   required context,
//   bool? readOnly = true,
//   double? height = 40,
//   double? width = 294,
//   String? title,
//   Icon? iconData,
//   Color? titleColor,
//   Color? iconColor,
//   Color? styleColor,
//   double? iconSize,
//   double? titleSize,
//   FontWeight? fontWeightTitle,
//   required Function() function,
// }) {
//   return Card(
//     elevation: 10,
//     child: Container(
//       alignment: Alignment.center,
//       height: height ?? 40,
//       width: width ?? 294,
//       child: TextFormField(
//         readOnly: readOnly!,
//         style: TextStyle(color: styleColor ?? Colors.black),
//         onTap: () => function(),
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide(color: styleColor ?? secondaryColor),
//           ),
//           filled: true,
//           fillColor: secondaryColor,
//           disabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide(color: styleColor ?? secondaryColor),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide(color: styleColor ?? secondaryColor),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide(color: styleColor ?? secondaryColor),
//           ),
//           hintText: title ?? 'Search',
//           hintStyle: TextStyle(
//               fontSize: titleSize ?? 15,
//               color: titleColor ?? Colors.grey,
//               fontWeight: fontWeightTitle ?? FontWeight.w500),
//           prefixIcon: iconData ??
//               Icon(
//                 Icons.search,
//                 color: iconColor ?? Colors.black,
//                 size: iconSize ?? 24,
//               ),
//         ),
//       ),
//     ),
//   );
// }
