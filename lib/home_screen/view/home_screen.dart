import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/const.dart';
import 'package:food_delivery_app/drawer/view/drawer_view.dart';
import 'package:food_delivery_app/home_screen/widget/fruit_card_items.dart';
import 'package:food_delivery_app/home_screen/widget/item_title.dart';
import 'package:food_delivery_app/home_screen/widget/vegcardshow.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: const Image(
                    image: AssetImage('asset/images/hamberger2.png'),
                    width: 35,
                    height: 35,
                  ),
                  onTap: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    size: 30,
                  ),
                ),
              ],
            ),
            kHight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 310,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      border:
                          Border.all(color: Colors.grey.shade500, width: 1.5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Type Here for Search...',
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintStyle: TextStyle(
                            color: Colors.grey.shade300, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
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
                        child: BorderedText(
                          strokeWidth: 3.0,
                          strokeColor: Colors.green,
                          child: const Text(
                            "\n\nVegans",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            kHight10,
            const ItemsHeading(
              title: 'Vegitables',
            ),
            kHight10,
            const VegItemCard(
           
            ),
            kHight10,
            const ItemsHeading(
              title: 'Fruits',
            ),
            kHight10,
             const FruitItemCard(
              
            )
          ],
        ),
      ),
    );
  }
}


