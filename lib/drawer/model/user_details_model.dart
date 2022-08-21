import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  String userName;
  String email;
  UserDetails({required this.userName, required this.email});
  factory UserDetails.fromJson( DocumentSnapshot<Map<String, dynamic>> snapShort) {
    return UserDetails(
      userName: snapShort['name'],
      email: snapShort['email'],
    );
  }
  
}
