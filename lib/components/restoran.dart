
import 'dart:convert';

class Restaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late String rating;
  late String menus;
 
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.rating,
    required this.city,
    required this.menus,
  });

  Restaurant.fromJson(Map<String, dynamic> article) {
  id = article['id'];
  name = article['name'];
  description = article['description'];
  pictureId = article['pictureId'];
  rating = article['rating'].toString();
  city = article['city'];
  }
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }
 
 
  final List parsed = jsonDecode(json)['restaurants'];
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}

