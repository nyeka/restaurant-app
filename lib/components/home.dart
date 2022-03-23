// import 'dart:convert';
import 'package:restaurant/components/restoran.dart';
import 'package:restaurant/components/restoran_detail.dart';
// import 'components/menuapp.dart';
import 'package:flutter/material.dart';

class Myhomepage extends StatelessWidget {
  static const routeName = '/restaurants_list';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: FutureBuilder<String>(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/restoran.json'),
            builder: (context, snapshot) {
              final List<Restaurant> restaurants =
                  parseRestaurant(snapshot.data);
              // var response = jsonDecode(snapshot.data.toString());
              // var data = RestaurantData.fromJson(response);
              return ListView.builder(
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    return _buildRestaurantsitem(
                        context, restaurants[index]);
                  });
            },
          ),
        ),
      ),
    );
  }
}

Widget _buildRestaurantsitem(BuildContext context, Restaurant restaurants) {
  return Column(
    children: [
      ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 21, vertical: 8.0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            restaurants.pictureId,
            width: 80,
            height: 99,
            scale: 3.4,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          restaurants.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Column(children: [
          Row(
            children: [
              SizedBox(
                height: 12,
                width: 3,
              ),
              Icon(
                Icons.maps_home_work,
                size: 15,
              ),
              SizedBox(
                width: 8,
                height: 30,
              ),
              Text(restaurants.city),
            ],
          ),
          Container(
            child: Align(
              // alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 0.1, top: 4),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 18,
                    ),
                    Text(restaurants.rating.toString()),
                  ],
                ),
              ),
            ),
          ),
        ]),
        onTap: () {
          Navigator.pushNamed(
            context,
            Detailhome.routeName,
            arguments: restaurants,
          );
        },
      ),
      // Container(
      //   padding: EdgeInsets.only(left: 120),
      //   child: Align(alignment: Alignment.bottomLeft, child: Text('testing'),),
      // ),
    ],
  );
}
