class WishListProductModel {
  String id;
  String image;
  String name;
  String price;
  int bgColor;
  WishListProductModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.bgColor});
  factory WishListProductModel.fromJson(Map<String, dynamic> json) {
    return WishListProductModel(
        id: json['id'],
        image: json['image'],
        name: json['name'],
        price: json['price'],
        bgColor: json['bgcolor'] ?? 4288337194);
  }
}
