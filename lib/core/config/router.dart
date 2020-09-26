import 'package:flutter/material.dart';
import 'package:flutter_grocer_app/app/screens/screens.dart';

const String initialRoute = Home.route;
//const String initialRoute = "addNewContactSubmit";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/locationSelection':
        return MaterialPageRoute(builder: (_) => LocationSelection());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
