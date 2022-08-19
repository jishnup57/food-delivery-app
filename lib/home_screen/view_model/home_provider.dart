import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/home_screen/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeProv extends ChangeNotifier {


  final CollectionReference productsFruits =
      FirebaseFirestore.instance.collection("fruites");


  final CollectionReference productsVegitables =
      FirebaseFirestore.instance.collection("vegitables");

  List<ProductModel> convertToProductList(
      AsyncSnapshot<QuerySnapshot> streamSnapshot) {
    if (streamSnapshot.hasData) {
      final newlist = streamSnapshot.data!.docs.map((e) {
        return ProductModel.fromJson(e.data() as Map<String, dynamic>);
      }).toList();
      return newlist;
    } else {
      return [];
    }
  }
}
