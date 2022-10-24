import 'package:flutter/material.dart';
import 'package:nyumba/Widgets/Favorite_page/favorite.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Saved Lists",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop(context);
            },
          ),
        ),
        body: savedList());
  }
}
