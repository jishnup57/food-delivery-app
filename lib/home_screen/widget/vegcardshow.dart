import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/home_screen/view_model/home_provider.dart';
import 'package:food_delivery_app/home_screen/widget/show_card.dart';
import 'package:provider/provider.dart';

class VegItemCard extends StatelessWidget {
  const VegItemCard({
    Key? key,
   
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 220,
      child:StreamBuilder(
          stream: context.read<HomeProv>().productsVegitables.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            final newlist =
                context.read<HomeProv>().convertToProductList(streamSnapshot);
            return ShowCard(list: newlist);
          }),
    );
  }
}
