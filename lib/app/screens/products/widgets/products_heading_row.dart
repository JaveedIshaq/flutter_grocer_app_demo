import 'package:flutter/material.dart';
import 'package:flutter_grocer_app/core/config/config.dart';

class ProductsHeadingRow extends StatelessWidget {
  final String heading;
  const ProductsHeadingRow({
    Key key,
    @required this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$heading",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        OutlineButton(
          borderSide: BorderSide(color: Colors.grey),
          onPressed: () {},
          child: Text(
            "View All",
            style: TextStyle(color: grocerGreenDark),
          ),
        ),
      ],
    );
  }
}
