import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/const.dart';
import 'package:food_delivery_app/drawer/view_model/drawer_view_model.dart';
import 'package:provider/provider.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black.withOpacity(0.8),
      child: Consumer<DrawerProv>(
        builder: (context, value, _) => ListView(
          children:   [
            Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(image: AssetImage('asset/images/women.jpg'),fit: BoxFit.fitWidth)
              ),
              child:   Align(
                alignment: Alignment.bottomLeft,
                child: ListTile(
                title: Text(
                  value.userName
                  ,
                  textAlign: TextAlign.center,
                  textScaleFactor: 2,
                  style: kTextStyleUser,
                ),
                subtitle:  Text(value.userEmail,textAlign: TextAlign.center,style: kTextStyleUser,),
                          ),
              ),
            ),
          
             const DrawerCard(icon: Icons.favorite,title: 'WISHLIST',),
            const DrawerCard(icon: Icons.shopping_bag_sharp,title: ' CART',)
          ],
        ),
      ),
    );
  }
}

class DrawerCard extends StatelessWidget {
  const DrawerCard({
    Key? key,
    required this. icon,
    required this.title,
  }) : super(key: key);
 final IconData icon;
 final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
     color: Colors.green.shade300,
     child:   ListTile(
       leading: Icon(icon,size: 28,),
       title: Text(title,style: kTextStyleDrawer,),
       trailing: const Icon(Icons.arrow_forward_ios),
     ),
            );
  }
}
