import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String id;
  String image;
  String name;
  String price;
  String rating;
  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
  });
  factory ProductModel.fromJson(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return ProductModel(
      id: snapshot['id'],
      image: snapshot['image'],
      name: snapshot['name'],
      price: snapshot['price'],
      rating: snapshot['rating'],
    );
  }
    factory ProductModel.fromJson1(
    Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      price: json['price'],
      rating: json['rating'],
    );
  }
}
