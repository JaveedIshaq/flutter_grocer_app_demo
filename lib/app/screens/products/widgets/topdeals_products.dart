import 'package:flutter/material.dart';
import 'package:flutter_grocer_app/app/screens/products/widgets/product_item.dart';
import 'package:flutter_grocer_app/app/screens/products/widgets/products_heading_row.dart';
import 'package:flutter_grocer_app/core/config/enums.dart';
import 'package:flutter_grocer_app/core/providers/deals_provider.dart';
import 'package:provider/provider.dart';

class TopDealsProducts extends StatefulWidget {
  const TopDealsProducts({
    Key key,
  }) : super(key: key);

  @override
  _TopDealsProductsState createState() => _TopDealsProductsState();
}

class _TopDealsProductsState extends State<TopDealsProducts> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    //_getFeaturedProductsList();
  }

  @override
  Widget build(BuildContext context) {
    var dealsProducts = Provider.of<DealsProvider>(context);
    return Container(
      height: 405,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductsHeadingRow(heading: "Top Deals"),
            ),
            Expanded(
              child: (dealsProducts.state == ViewState.Busy)
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: dealsProducts.productsList.length,
                      itemBuilder: (context, index) {
                        return ProductSingleItem(
                          product: dealsProducts.productsList[index],
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
