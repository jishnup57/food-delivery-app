import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/const.dart';
import 'package:food_delivery_app/home_screen/model/product_model.dart';
import 'package:food_delivery_app/showproduct/widget/nutrition_text.dart';
import 'package:food_delivery_app/widget/commonappbar.dart';

class ShowProduct extends StatelessWidget {
  const ShowProduct({Key? key,required this.item}) : super(key: key);
  final ProductModel item;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size(double.infinity, 80),child: CommonAppBar(item: item),),
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
                  top: 1,
                  left: width / 4,
                  child:
                   Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(item.image),
                      
                    ),
                     
                      
                  ),
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
                  '${item.name} are hign in pottassium and contain good level of protine and fiber.One medium size banana contains 422 milligrams of pottassium.',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Nutrition value',
                  style: kTextStyleAppBar.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                CircleAvatar(
                  backgroundColor: Colors.green,
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
                          primary: Colors.green,
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