import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/app_router.dart';
import 'package:food_delivery_app/config/const.dart';
import 'package:food_delivery_app/home_screen/model/product_model.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    Key? key,
    required this.item,
    this.visible=true,
  }) : super(key: key);

  final ProductModel item;
  final bool visible;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:  Color(item.bgColor),
      leading: TextButton.icon(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () =>Routes.pop(),
        label: Text(
          'BACK',
          style: kTextStyleAppBar.copyWith(fontSize: 18),
        ),
      ),
      actions: [
        Visibility(
          visible:visible ,
          child: IconButton(
            icon: const Icon(Icons.favorite_outline),
            onPressed: () {},
          ),
        ),
        IconButton(
          icon: const Icon(Icons.shopping_bag_outlined),
          onPressed: () {},
        )
      ],
      elevation: 0,
      leadingWidth: 100,
    );
  }
}
