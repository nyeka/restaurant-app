import 'package:flutter/material.dart';
import 'package:restaurant/components/home.dart';
// import 'package:restaurant/components/menuapp.dart';
import 'components/restoran_detail.dart';
import './components/restoran.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: Myhomepage.routeName,
      routes: {
        Myhomepage.routeName: (context) => Myhomepage(),
        Detailhome.routeName: (context) => Detailhome(
            restaurants:
                ModalRoute.of(context)?.settings.arguments as Restaurant),
      },
    );
  }
}
