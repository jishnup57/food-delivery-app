
class ProductModel {
  String id;
  String image;
  String name;
  String price;
  String rating;
  int bgColor;
  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
    required this.bgColor
  });
    factory ProductModel.fromJson(
    Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      price: json['price'],
      rating: json['rating'],
      bgColor: json['bgcolor']?? 4288337194
    );
  }
}
