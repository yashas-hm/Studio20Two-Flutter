import 'package:flutter/foundation.dart';

class Profile with ChangeNotifier{
  final String name;
  final String contact;
  final String email;
  final String authId;

  Profile({this.authId, this.name, this.contact, this.email});
}