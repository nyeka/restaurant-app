import 'package:flutter/material.dart';
import 'restoran.dart';

class Detailhome extends StatelessWidget {
  static const routeName = './restaurants_detail';
  final Restaurant restaurants;
  // ignore: use_key_in_widget_constructors
  const Detailhome({required this.restaurants});

  @override
  Widget build(BuildContext context) {
    final mediaheight = MediaQuery.of(context).size.height;
    final mediawidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Hero(
                tag: restaurants.pictureId,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    child: Image.network(restaurants.pictureId)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 27),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurants.name,
                      style: const TextStyle(
                          fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: mediaheight * 0.025,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.maps_home_work,
                          size: 15,
                        ),
                        SizedBox(
                          width: mediawidth * 0.025,
                        ),
                        Text(restaurants.city),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 17,
                        ),
                        SizedBox(
                          height: mediaheight * 0.025,
                          width: mediawidth * 0.025,
                        ),
                        Text(restaurants.rating.toString()),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, right: 15),
                      child: Text(
                        restaurants.description,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
