import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class Rating extends StatelessWidget {
  final double rating;

  const Rating({super.key, required this.rating});


  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = const Icon(
        Icons.star,
        color: CPColors.grey600,
        size: 12
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = const Icon(
        Icons.star_half,
        color: CPColors.pink,
        size: 12
      );
    } else {
      icon = const Icon(
        Icons.star,
        color: CPColors.pink,
        size: 12
      );
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: List.generate(5, (index) => buildStar(context, index)));
  }
}