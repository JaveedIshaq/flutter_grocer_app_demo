import 'package:flutter/material.dart';
import 'package:flutter_grocer_app/app/widgets/addcart_button.dart';
import 'package:flutter_grocer_app/core/config/config.dart';
import 'package:flutter_grocer_app/core/models/product.dart';

class ProductSingleItem extends StatelessWidget {
  final Product product;
  const ProductSingleItem({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0.11,
            blurRadius: 0.11,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                product.image,
                width: 120,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${product.name}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text("${product.unit}"),
                  ),
                  Wrap(
                    children: [
                      Text(
                        "Rs.${calCulateSalePrice(price: product.price, deal: product.dealTitle)}",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.red[900],
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Rs.${product.price}",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  Chip(
                    backgroundColor: Colors.red[900],
                    label: Text(
                      "${product.dealTitle}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              AddCartButton(
                bgColor: addCartbtnBg,
                title: "Add to Cart",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  int calCulateSalePrice({int price, String deal}) {
    var splited = deal.split('%');

    int discount = int.parse(splited[0]);

    int salePrice = 0;

    salePrice = price - (price / 100 * discount).toInt();
    return salePrice;
  }
}
