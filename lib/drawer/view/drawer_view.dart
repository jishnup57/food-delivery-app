import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/const.dart';
import 'package:food_delivery_app/drawer/view_model/drawer_view_model.dart';
import 'package:provider/provider.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kMainColor,
      child: Consumer<DrawerProv>(
        builder: (context, value, _) => ListView(
          children:   [
            ListTile(
              title: Text(
                value.userName
                ,
                textAlign: TextAlign.center,
                textScaleFactor: 2,
                style: kTextStyleUser,
              ),
              subtitle:  Text(value.userEmail,textAlign: TextAlign.center,style: kTextStyleUser,),
            )
          ],
        ),
      ),
    );
  }
}
