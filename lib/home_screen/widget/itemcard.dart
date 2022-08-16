import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app/config/style.dart';

class MainItemCard extends StatelessWidget {
  const MainItemCard({
    Key? key,
    required this.product
  }) : super(key: key);
  final String product;
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 220,
      child: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) => Padding(
          padding: const EdgeInsets.only(right: 8.0),
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
                  tag: 'tomato',
                  child: Container(
                    height: 130,
                    width: double.infinity,
                    decoration:  BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('asset/images/$product.png'))),
                  ),
                ),
                Text(
                  product,
                  style: gFontsLato(fw: FontWeight.w800),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " \$200",
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
                  initialRating: 3,
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
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
