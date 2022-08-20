import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/const.dart';
import 'package:food_delivery_app/showproduct/widget/nutrition_text.dart';

class ShowProduct extends StatelessWidget {
  const ShowProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.withOpacity(0.8),
        leading: TextButton.icon(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {},
          label: Text(
            'BACK',
            style: kTextStyleAppBar.copyWith(fontSize: 18),
          ),
        ),
        actions: [
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
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.yellow.withOpacity(0.8),
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width,
                              MediaQuery.of(context).size.height / 4)),
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
                  child: Image.asset(
                    'asset/images/banana.png',
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
                  'Breaking Banana',
                  style: kTextStyleAppBar.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  '₹30/Kg',
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
