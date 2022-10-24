import 'package:flutter/material.dart';

Widget categoryButton(String? text) {
  return Container(
    height: 40,
    width: 105,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 89, 58, 143),
      borderRadius: BorderRadius.circular(5),
    ),
    // ignore: prefer_const_constructors
    child: Center(
      child: Text(
        '$text',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  );
}
