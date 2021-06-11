import 'package:flutter/material.dart';

showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () { },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text("Site is under construction.\nSome features might not be available.\nSorry for the inconvenience"),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}