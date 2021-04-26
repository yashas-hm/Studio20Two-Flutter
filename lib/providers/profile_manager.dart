import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import './auth.dart';

import './profile.dart';
import '../utils/APIKeys.dart';

class ProfileManager with ChangeNotifier {
  final Auth _auth;

  ProfileManager(this._auth);

  Future<void> fetchData() async {
    final url = Uri.https(
        APIKey.databaseUrl, "/profile/${_auth.userId}.json", {"auth": _auth.token});
    try {
      final response = await http.get(url);
      print(response);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
    notifyListeners();
  }

  Future<void> update(Profile profile, BuildContext context) async {
    final url = Uri.https(
        APIKey.databaseUrl, "/profile/${_auth.userId}.json", {"auth": _auth.token});
    try {
      final response = await http.patch(
        url,
        body: json.encode({
          'userName': profile.userName,
          'contact': profile.contact,
          'email': profile.email,
        }),
      );
      print(response);
      Provider.of<Profile>(context, listen: false).setData(
        profile.userName,
        profile.contact,
        profile.email,
      );
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
    notifyListeners();
  }

  Future<void> set(
    String name,
    String contact,
    String email,
    BuildContext context,
  ) async {
    final url = Uri.https(
        APIKey.databaseUrl, "/profile/${_auth.userId}.json", {"auth": _auth.token});
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'userName': name,
          'contact': contact,
          'email': email,
        }),
      );
      print(response);
      Provider.of<Profile>(context, listen: false).setData(
        name,
        contact,
        email,
      );
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
    notifyListeners();
  }

  Future<bool> dataExists() async {
    final url = Uri.https(
        APIKey.databaseUrl, "/profile/${_auth.userId}.json", {"auth": _auth.token});
    final result = await http.get(url);
    if (result.body == null) {
      return false;
    } else {
      return true;
    }
  }
}
