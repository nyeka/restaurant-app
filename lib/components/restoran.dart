import 'dart:convert';

class Restaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late String rating;
  late Menus menus;

  Restaurant(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.rating,
      required this.city,
      required this.menus});

  Restaurant.fromJson(Map<String, dynamic> restaurant) {
    id = restaurant['id'];
    name = restaurant['name'];
    description = restaurant['description'];
    pictureId = restaurant['pictureId'];
    rating = restaurant['rating'].toString();
    city = restaurant['city'];
  }
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json)['restaurants'];
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}

class Menus {
  late List<Menus> foods;
  late String name;
  late List<Menus> drinks;

  Menus({required this.drinks, required this.foods, required this.name});

  Menus.fromJson(Map<String, dynamic> menu) {
    Map menus = menu['menus'];
    drinks = menus['drink'];
    foods = menus['foods'];
  }
}

