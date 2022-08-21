import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_app/wishlist/model/wishlist_model.dart';

class WishProv extends ChangeNotifier {


  final CollectionReference productsFruits =
      FirebaseFirestore.instance.collection("fruites");


  final CollectionReference productsVegitables =
      FirebaseFirestore.instance.collection("vegitables");

  List<WishListProductModel> convertToProductList(
      AsyncSnapshot<QuerySnapshot> streamSnapshot) {
    if (streamSnapshot.hasData) {
      final newlist = streamSnapshot.data!.docs.map((e) {
        return WishListProductModel.fromJson(e.data() as Map<String, dynamic>);
      }).toList();
      return newlist;
    } else {
      return [];
    }
  }
}
