import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/home_screen/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class HomeProv extends ChangeNotifier{
  HomeProv(){
    getAllVegitablesProduct();
    getAllFruitesItems();
  }
  List<ProductModel> allVegProduct=[];
  List<ProductModel> allFruitProduct=[];
  getAllVegitablesProduct()async{
    allVegProduct.clear();
   QuerySnapshot<Map<String, dynamic>> snapshort=await FirebaseFirestore.instance.collection("vegitables").get();
   List<ProductModel> list=snapshort.docs.map((e) => ProductModel.fromJson(e)).toList();
   allVegProduct.addAll(list);
   notifyListeners();
  }
  getAllFruitesItems()async{
    allFruitProduct.clear();
     QuerySnapshot<Map<String, dynamic>> snapshort=await FirebaseFirestore.instance.collection("fruites").get();
     List<ProductModel> list=snapshort.docs.map((e) => ProductModel.fromJson(e)).toList();
     allFruitProduct.addAll(list);
     notifyListeners();
  }
}