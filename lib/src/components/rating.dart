import 'package:flutter/material.dart';

import 'package:cinema_plus/src/style/color/cp_color.dart';

typedef RatingChangeCallback = void Function(double rating);

class Rating extends StatelessWidget {
  final double rating;
  final double? size;

  const Rating({super.key, required this.rating, this.size = 12});


  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star,
        color: CPColors.grey600,
        size: size
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: CPColors.pink,
        size: size
      );
    } else {
      icon = Icon(
        Icons.star,
        color: CPColors.pink,
        size: size
      );
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: List.generate(5, (index) => buildStar(context, index)));
  }
}