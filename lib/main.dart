import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grocer_app/core/providers/categories_provider.dart';
import 'package:flutter_grocer_app/core/providers/deals_provider.dart';
import 'package:flutter_grocer_app/core/providers/feature_products_provider.dart';
import 'package:flutter_grocer_app/core/providers/map_provider.dart';
import 'package:flutter_grocer_app/core/providers/slider_provider.dart';
import 'package:provider/provider.dart';

import 'core/config/config.dart';

Future<void> main() async {
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  return runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //updateStatusBarColor(context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<MapProvider>(
              create: (context) => MapProvider()),
          ChangeNotifierProvider<DealsProvider>(
              create: (context) => DealsProvider()),
          ChangeNotifierProvider<FeaturesProductsProvider>(
              create: (context) => FeaturesProductsProvider()),
          ChangeNotifierProvider<CategoriesProvider>(
              create: (context) => CategoriesProvider()),
          ChangeNotifierProvider<SlidersProvider>(
              create: (context) => SlidersProvider()),
        ],
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Grocer Demo',
            theme: ThemeData(
              primarySwatch: Colors.green,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: initialRoute,
            onGenerateRoute: Router.generateRoute,
          ),
        ));
  }
}
