

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/drawer/model/user_details_model.dart';

class DrawerProv extends ChangeNotifier{
  DrawerProv(){
    getUserDetails();
  }
  String _userName='';
  String get userName=>_userName;


  String _email='';
  String get userEmail=>_email;


  getUserDetails()async{
  final snapshort=await FirebaseFirestore.instance.collection("users").doc('jishnupvkd@gmail.com').get();
  final user=UserDetails.fromJson(snapshort);
   _userName=user.userName;
   _email=user.email;
   notifyListeners();
}

  
}