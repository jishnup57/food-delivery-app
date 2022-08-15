import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:food_delivery_app/home_screen/view/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:bordered_text/bordered_text.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  _googleSignUp() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await auth.signInWithCredential(credential)).user;
      // print("signed in " + user.displayName);

      return user;
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           // const AppLogo(),
             BorderedText(
                strokeWidth: 10.0,
                
                strokeColor: Colors.green,
                child: const Text(
                  "Vegans",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 100,
                  ),
                ),
              ),
             const SizedBox(
              height:30,
            ),
            SignInButton(Buttons.Google,
                text: "Sign up with Google", onPressed: () {
                    _googleSignUp().then(
                  (value) => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) =>  HomeScreen(),
                    ),
                  ),
                );
                }),
            SignInButton(
              Buttons.Apple,
              onPressed: () {
              
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
    this. fSize=70,
    this. letterSpacing=5,
    this. strokeWidth=10,
    this.name='',
  }) : super(key: key);
  
final  double fSize;
final  String name;
final double letterSpacing;
final double strokeWidth;
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Text(
    '${name}Vegans',
    style: TextStyle(
      fontSize: fSize,
      letterSpacing: letterSpacing,
      fontWeight: FontWeight.bold,
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..color = Colors.green.shade800,
    ),
          ),
           Text(
    '${name}Vegans',
    style: TextStyle(
      fontSize: fSize,
      letterSpacing: letterSpacing,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
          ),
        ],
      );
  }
}
