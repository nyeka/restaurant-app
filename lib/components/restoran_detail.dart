import 'package:flutter/material.dart';
// import 'components/menuapp.dart';
import 'restoran.dart';

class Detailhome extends StatelessWidget {
  final Restaurant restaurants;
  const Detailhome({required this.restaurants});

    static const routeName = '/restaurants_detail';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Image.network(restaurants.pictureId),
            )
          ],
        ),
      ),
    );
  }
}
