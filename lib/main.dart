import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/app_router.dart';
import 'package:food_delivery_app/config/theme.dart';
import 'package:food_delivery_app/drawer/view_model/drawer_view_model.dart';
import 'package:food_delivery_app/home_screen/view_model/home_provider.dart';
import 'package:food_delivery_app/showproduct/view_model/wish_view_model.dart';
import 'package:food_delivery_app/wishlist/view/wishlist.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProv(),),
        ChangeNotifierProvider(create: (context) => DrawerProv(),),
        ChangeNotifierProvider(create: (context) => WishProv(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Routes.navigatorKey,
       theme: theme(),
      //  onGenerateRoute: AppRouter.onGenerateRoute,
      //  initialRoute: HomeScreen.routeName,
      home:   const WishList()
      ),
    );
  }
}

