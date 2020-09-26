import 'package:flutter_grocer_app/core/config/config.dart';
import 'package:flutter_grocer_app/core/providers/map_provider.dart';
import 'package:flutter_grocer_app/app/screens/location_selection.dart/location_picker.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';

class LocationSelection extends StatefulWidget {
  static const String route = "/locationSelection";
  @override
  _LocationSelectionState createState() => _LocationSelectionState();
}

class _LocationSelectionState extends State<LocationSelection> {
  final CarouselController _controller = CarouselController();
  int activeTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Image.asset(
                      "assets/images/ic_route.png",
                      height: 110,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[],
                    ),
                  )
                ],
              ),
            ),
            // list of searched Placed
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: (activeTabIndex == 0)
                                ? grocerGreenDark
                                : Colors.grey,
                            width: 3.0,
                          ),
                        ),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            activeTabIndex = 0;
                          });
                          _controller.animateToPage(0);
                        },
                        child: Text(
                          'Recent',
                          style: TextStyle(
                              color: (activeTabIndex == 0)
                                  ? grocerGreenDark
                                  : grey2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color:
                                (activeTabIndex == 1) ? grocerGreenDark : grey2,
                            width: 3.0,
                          ),
                        ),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            activeTabIndex = 1;
                          });
                          _controller.animateToPage(1);
                        },
                        child: Text(
                          'Saved',
                          style: TextStyle(
                              color: (activeTabIndex == 1)
                                  ? grocerGreenDark
                                  : grey2),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            CarouselSlider(
              items: [
                Container(
                  color: Colors.grey[300],
                ),
              ],
              options: CarouselOptions(
                height: 500,
                viewportFraction: 1.0,
                enlargeCenterPage: true,
              ),
              carouselController: _controller,
            ),
          ],
        ),
      ),
    );
  }

  // Navigate to Place Picker
  navigateToPlacePicker(MapProvider mapProvider, String placeName) async {
    LatLng latLng = LatLng(30.6550935, 73.1001703);

    PickResult place = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationPicker(kInitialPosition: latLng),
      ),
    );
  }
}
