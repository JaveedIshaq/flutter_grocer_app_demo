import 'dart:convert';

import 'package:flutter_grocer_app/core/config/enums.dart';
import 'package:flutter_grocer_app/core/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_grocer_app/core/providers/appstate_base_provider.dart';

class DealsProvider extends AppStateBaseProvider {
  var _productsList = [];

  List get productsList => _productsList;

  Future<void> getDelasProductsList() async {
    setState(ViewState.Busy);

    final response = await http
        .get("https://endpoints.grocerapps.com/v3/deals?vendor_id=20");

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);

      _productsList =
          parsed['data']['flat'].map((item) => Product.fromJson(item)).toList();

      print("============ products length is ${_productsList.length}");

      setState(ViewState.Idle);
    }
  }
}
