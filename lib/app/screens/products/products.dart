import 'package:flutter/material.dart';
import 'package:flutter_grocer_app/app/screens/products/widgets/featured_products.dart';
import 'package:flutter_grocer_app/app/screens/products/widgets/featured_sliders.dart';
import 'package:flutter_grocer_app/app/screens/products/widgets/products_catgories.dart';
import 'package:flutter_grocer_app/app/screens/products/widgets/topdeals_products.dart';
import 'package:flutter_grocer_app/app/widgets/app_drawer.dart';
import 'package:flutter_grocer_app/core/config/config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      key: _drawerKey,
      drawerEdgeDragWidth: 0,
      drawer: Drawer(
        child: AppDrawer(),
      ),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            _drawerKey.currentState.openDrawer();
          },
          child: Icon(
            Icons.menu,
            color: grocerGreenDark,
          ),
        ),
        backgroundColor: Colors.white,
        title: TextFormField(
          onTap: () async {},
          decoration: buildInputDecoration("What you are looking for", false),
          keyboardType: TextInputType.emailAddress,
        ),
        actions: [
          IconButton(
              icon: Container(
                padding: EdgeInsets.all(2),
                child: SvgPicture.asset(
                  "assets/images/basket.svg",
                  color: Colors.green,
                ),
              ),
              onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TopDealsProducts(),
            FeaturedSliders(),
            FeaturedProducts(),
            FeaturedSliders(),
            ProductCategories(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
