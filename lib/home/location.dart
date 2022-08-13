import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
   LocationScreen({Key? key,required this.titile}) : super(key: key);
    static const String routeName = '/location';
    String titile;
  static Route route() {
    return MaterialPageRoute(
      builder: (_) =>  LocationScreen(titile: 'location'),
      settings: const RouteSettings(name: routeName),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(titile)),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, '/');
        }, child: const Text('To home')),
      )
    );
  }
}
