import 'package:flutter/material.dart';

import 'package:flutter_grocer_app/app/screens/products/widgets/products_heading_row.dart';
import 'package:flutter_grocer_app/core/config/config.dart';
import 'package:flutter_grocer_app/core/models/category.dart';
import 'package:flutter_grocer_app/core/providers/categories_provider.dart';
import 'package:flutter_grocer_app/core/providers/feature_products_provider.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductCategories extends StatefulWidget {
  const ProductCategories({
    Key key,
  }) : super(key: key);

  @override
  _ProductCategoriesState createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var categories = Provider.of<CategoriesProvider>(context);
    return Container(
      height: 800,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: (categories.state == ViewState.Busy)
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: categories.categoriesList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        height: 100,
                        child: Card(
                          child: ListTile(
                            leading: Image.network(
                                "${categories.categoriesList[index].image}"),
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${categories.categoriesList[index].name}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            subtitle: Text(
                                "${categories.categoriesList[index].desc}"),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
