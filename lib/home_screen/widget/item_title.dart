
import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/style.dart';

class ItemsHeading extends StatelessWidget {
  const ItemsHeading({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: gFontsLato(),
        ),
        const Spacer(),
        Text(
          'View All',
          style: gFontsLato(
              fw: FontWeight.normal, clr: Colors.grey.shade600),
        ),
        Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
          color: Colors.grey.shade600,
        ),
      ],
    );
  }
}
