
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
