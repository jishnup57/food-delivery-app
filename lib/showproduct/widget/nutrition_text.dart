import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/const.dart';

class NutritionText extends StatelessWidget {
  const NutritionText({
    Key? key,
    required this.content,required this.value,
  }) : super(key: key);
 final String value,content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Text('$value g',style: kTextStyleAppBar.copyWith(fontSize: 22,fontWeight: FontWeight.bold),),
          Text(content,style: const TextStyle(color: Colors.grey),)
      ],
    );
  }
}