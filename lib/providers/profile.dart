import 'package:flutter/foundation.dart';

class Profile with ChangeNotifier {
  String userName;
  String contact;
  String email;

  Profile({
    this.userName,
    this.contact,
    this.email,
  });

  void setData(
    String name,
    String contact,
    String email,
  ) {
    this.userName = name;
    this.contact = contact;
    this.email = email;
    notifyListeners();
  }
}
