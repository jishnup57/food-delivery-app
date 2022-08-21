
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app/config/app_router.dart';

import '../../config/style.dart';
import '../../showproduct/view/show_product_view.dart';
import '../model/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
class ShowCard extends StatelessWidget {
  const ShowCard({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<ProductModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    itemBuilder: (BuildContext ctx, int index) {
      final modelData=list[index];
      return
      list.isNotEmpty? Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () => Routes.push(screen:  ShowProduct(item: modelData,)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 210,
          width: 140,
          child: Column(
            mainAxisSize:  MainAxisSize.min,
            children: [
              Hero(
                tag: modelData.name,
                child: Container(
                  height: 130,
                  width: double.infinity,
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                          image:
                              CachedNetworkImageProvider(modelData.image),),),
                ),
              ),
              Text(
                modelData.name,
                style: gFontsLato(fw: FontWeight.w800),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " ₹${modelData.price}",
                    style: gFontsLato(fw: FontWeight.w900),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              RatingBar.builder(
                initialRating: double.tryParse(modelData.rating)??5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 15,
                ignoreGestures:true,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  size: 3,
                  color: Colors.amber,
                ),
                onRatingUpdate: (value) {
                  
                },
              ),
            ],
          ),
        ),
      ),
    ):const CircularProgressIndicator(strokeWidth: 2,);
    },
    itemCount: list.length,
    scrollDirection: Axis.horizontal,
        );
  }
}
