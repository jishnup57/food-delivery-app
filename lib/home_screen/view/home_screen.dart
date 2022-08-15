import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/const.dart';
import 'package:food_delivery_app/config/style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: ListView(
          children: [
            kHight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(
                height: 50,
                width: 310,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10,),
                  border: Border.all(
                    color: Colors.grey.shade500,
                    width: 1.5
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                  child: TextFormField(
                    decoration:  InputDecoration(
                      hintText: 'Type Here for Search...',
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 22
                      ),

                    ),
                  ),
                ),
              ),
                Container(
                height: 50,
                width: 50,
                decoration:  BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10,),
                ),
                child:const Icon(Icons.search,color: Colors.white,size: 30,) ,
              ),
             
            ],),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('asset/images/offer2.png'),
                      fit: BoxFit.fitHeight,
                    )),
                child: Stack(
                  children: [
                    Positioned(
                      top: -45,
                      left: -13,
                      child: CircleAvatar(
                        backgroundColor: Colors.green.shade200,
                        radius: 50,
                        child: Stack(
                          children: [
                            Text(
                              '\n\n Vegans',
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 3
                                  ..color =Colors.white ,
                              ),
                            ),
                             Text(
                              '\n\n Vegans',
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            kHight10,
            Row(
              children: [
                Text(
                  'Vegitables',
                  style: gFontsLato(),
                ),
                const Spacer(),
                Text(
                  'View All',
                  style: gFontsLato(
                    fw: FontWeight.normal

                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                ),
              ],
            ),
            kHight10,
            LimitedBox(
              maxHeight: 210,
              child: ListView.builder(
                itemBuilder: (BuildContext ctx, int index) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 200,
                    width: 140,
                    child: Column(
                      children: [
                        Hero(
                          tag: 'tomato',
                          child: Container(
                            height: 130,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('asset/images/tomato.png'))),
                          ),
                        ),
                        Text(
                          'Tomato',
                          style: gFontsLato(fw: FontWeight.w800),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              " \$200",
                              style: gFontsLato(fw: FontWeight.w900),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
