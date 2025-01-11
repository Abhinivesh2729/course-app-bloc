import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';


class BannerPricing extends StatelessWidget {
  final int price;
  const BannerPricing({
    super.key, required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        Text(
          '\$${price+500}',
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            color: APP_CONSTANTS.primaryColor,
          ),
        ),
        SizedBox(width: 8),
        Text(
          '\$${price}',
          style: TextStyle(
            color: APP_CONSTANTS.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
