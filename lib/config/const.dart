import 'package:flutter/material.dart';
import 'package:food_delivery_app/home_screen/model/product_model.dart';

const kTextStyleAppBar = TextStyle(color: Colors.black, fontSize: 25);

const kTextStyleUser =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
const kTextStyleDrawer = TextStyle(
  color: Color(0xff466c48),
  fontWeight: FontWeight.w900,
  fontSize: 23,
  letterSpacing: 1.4,
);

final kMainColor = Colors.green.shade200;

const kHight10 = SizedBox(
  height: 10,
);

final item = ProductModel(
  id: 'dummy',
  image: 'dummy',
  name: 'dummy',
  price: 'dummy',
  rating: 'dummy',
  bgColor: 4294967295,
);
