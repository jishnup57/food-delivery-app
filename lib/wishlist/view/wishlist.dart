import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/const.dart';
import 'package:food_delivery_app/showproduct/view_model/wish_view_model.dart';
import 'package:food_delivery_app/widget/commonappbar.dart';
import 'package:food_delivery_app/wishlist/model/wishlist_model.dart';
import 'package:provider/provider.dart';

class WishList extends StatelessWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 55),
        child: CommonAppBar(
          item: item,
          visible: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: StreamBuilder(
          stream: context.read<WishProv>().productsFruits.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            final newlist =
                context.read<WishProv>().convertToProductList(streamSnapshot);
            return  ShowCard(productList: newlist,);
          },
        ),
      ),
    );
  }
}

class ShowCard extends StatelessWidget {
  const ShowCard({
    Key? key,
    required this.productList
  }) : super(key: key);
 final List<WishListProductModel> productList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: .8),
        itemCount: productList.length,
        itemBuilder: (ctx, i) {
          final item=productList[i];
          return Card(
            elevation: 7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: [
                Container(
                  height: 160,
                  decoration:  BoxDecoration(
                      color: Color(item.bgColor),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      image: DecorationImage(
                          image:NetworkImage(item.image))),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: kTextStyleAppBar.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '₹${item.price}/Kg',
                                style: kTextStyleAppBar.copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                              GestureDetector(
                                child: const Icon(Icons.favorite),
                                onTap: () {},
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
