import 'dart:convert';

import 'package:flutter_grocer_app/core/config/enums.dart';
import 'package:flutter_grocer_app/core/models/slider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_grocer_app/core/providers/appstate_base_provider.dart';

class SlidersProvider extends AppStateBaseProvider {
  var _slidersList = [];

  List get slidersList => _slidersList;

  Future<void> getSlidersList() async {
    setState(ViewState.Busy);

    final response = await http
        .get("https://endpoints.grocerapps.com/v2/sliders?vendor_id=20");

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);

      _slidersList =
          parsed['data'].map((item) => Sliders.fromJson(item)).toList();

      print("============ products length is ${_slidersList.length}");

      setState(ViewState.Idle);
    }
  }
}
