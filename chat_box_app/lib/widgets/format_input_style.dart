import 'package:flutter/material.dart';

InputDecoration forminputstyle({required String labelText}) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.blue.shade100,
    label: Text(
      labelText,
      style: TextStyle(color: Colors.blue, fontSize: 20),
    ),
    contentPadding: EdgeInsets.only(bottom: 8, left: 8, top: 3),
  );
}