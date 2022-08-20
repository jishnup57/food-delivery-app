import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/app_router.dart';
import 'package:food_delivery_app/config/const.dart';
import 'package:food_delivery_app/home_screen/model/product_model.dart';
import 'package:food_delivery_app/showproduct/widget/nutrition_text.dart';

class ShowProduct extends StatelessWidget {
  const ShowProduct({Key? key,required this.item}) : super(key: key);
  final ProductModel item;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(item.bgColor),
        leading: TextButton.icon(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () =>Routes.pop(),
          label: Text(
            'BACK',
            style: kTextStyleAppBar.copyWith(fontSize: 18),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_outline),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {},
          )
        ],
        elevation: 0,
        leadingWidth: 100,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  ClipPath(
                    clipper: ClipPathClass(),
                    child: Container(
                      width: double.infinity,
                      height: 125,
                     color: Color(item.bgColor),
                      
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
              Positioned(
                  top: height / 35,
                  left: width / 3,
                  child: Image.network(
                    item.image,
                    height: 150,
                    width: 150,
                  ))
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  item.name,
                  style: kTextStyleAppBar.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  '₹${item.price}/Kg',
                  style: kTextStyleAppBar.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'Banana are hign in pottassium and contain good level of protine and fiber.One medium size banana contains 422 milligrams of pottassium.',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Nutrition value',
                  style: kTextStyleAppBar.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                CircleAvatar(
                  backgroundColor: Colors.deepPurple.shade300,
                  radius: width / 9.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '160',
                        style: kTextStyleUser.copyWith(fontSize: 20),
                      ),
                      const Text('Calories')
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    NutritionText(value: '0.3', content: 'Fat'),
                    NutritionText(value: '0.5', content: 'Carbohydrate'),
                    NutritionText(value: '0.8', content: 'Protein')
                  ],
                ),
                SizedBox(
                  width: width - 60,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple.shade300,
                          shape: const StadiumBorder()),
                      child: Text(
                        'Add to Cart',
                        style: kTextStyleUser.copyWith(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 80);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 80);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}