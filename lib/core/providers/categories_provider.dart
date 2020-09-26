import 'dart:convert';

import 'package:flutter_grocer_app/core/config/enums.dart';
import 'package:flutter_grocer_app/core/models/category.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_grocer_app/core/providers/appstate_base_provider.dart';

class CategoriesProvider extends AppStateBaseProvider {
  var _categoriesList = [];

  List get categoriesList => _categoriesList;

  Future<void> getCategoriesList() async {
    setState(ViewState.Busy);

    final response = await http.get(
        "https://endpoints.grocerapps.com/v2/categories/list?vendor_id=20");

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);

      _categoriesList = parsed['data']['tree']
          .map((item) => Category.fromJson(item))
          .toList();

      print("============ categoriesList length is ${_categoriesList.length}");

      setState(ViewState.Idle);
    }
  }
}
