import 'package:flutter/material.dart';
import 'package:flutter_grocer_app/app/screens/products/widgets/product_item.dart';
import 'package:flutter_grocer_app/app/screens/products/widgets/products_heading_row.dart';
import 'package:flutter_grocer_app/core/config/config.dart';

import 'package:flutter_grocer_app/core/models/product.dart';
import 'package:flutter_grocer_app/core/providers/feature_products_provider.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class FeaturedProducts extends StatefulWidget {
  const FeaturedProducts({
    Key key,
  }) : super(key: key);

  @override
  _FeaturedProductsState createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var featuredProducts = Provider.of<FeaturesProductsProvider>(context);

    return Container(
      height: 405,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductsHeadingRow(heading: "Featured Products"),
            ),
            Expanded(
              child: (featuredProducts.state == ViewState.Busy)
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: featuredProducts.productsList.length,
                      itemBuilder: (context, index) {
                        return ProductSingleItem(
                          product: featuredProducts.productsList[index],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
