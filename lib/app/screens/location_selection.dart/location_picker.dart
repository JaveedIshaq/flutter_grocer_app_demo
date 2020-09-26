import 'package:flutter_grocer_app/core/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_webservice/places.dart';

class LocationPicker extends StatefulWidget {
  final LatLng kInitialPosition;

  const LocationPicker({Key key, this.kInitialPosition}) : super(key: key);
  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  //static final kInitialPosition = LatLng(30.3753, 69.3451);
  PickResult selectedPlace;
  @override
  Widget build(BuildContext context) {
    return PlacePicker(
      apiKey: Constants.mapApiKey,
      initialPosition: widget.kInitialPosition,
      useCurrentLocation: false,
      selectInitialPosition: false,
      autocompleteComponents: [
        Component(Component.country, "pk"),
      ],
      //usePlaceDetailSearch: true,
      onPlacePicked: (result) {
        //Navigator.of(context).pop();
        setState(() {
          selectedPlace = result;
        });
      },
      //forceSearchOnZoomChanged: true,
      //automaticallyImplyAppBarLeading: false,
      //autocompleteLanguage: "ko",
      region: 'pk',
      //selectInitialPosition: true,
      selectedPlaceWidgetBuilder:
          (_, selectedPlace, state, isSearchBarFocused) {
        print("state: $state, isSearchBarFocused: $isSearchBarFocused");
        return isSearchBarFocused
            ? Container()
            : FloatingCard(
                bottomPosition:
                    0.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                leftPosition: 0.0,
                rightPosition: 0.0,
                borderRadius: BorderRadius.circular(12.0),
                child: state == SearchingState.Searching
                    ? Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("${selectedPlace.formattedAddress}"),
                            RaisedButton(
                              color: Colors.black87,
                              child: Text(
                                "Pick this Place",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
                                //            this will override default 'Select here' Button.
                                print("do something with [selectedPlace] data");
                                Navigator.pop(context, selectedPlace);
                              },
                            ),
                          ],
                        ),
                      ),
              );
      },
      pinBuilder: (context, state) {
        if (state == PinState.Idle) {
          return Image.asset("assets/images/location_pick_icon.png",
              height: 50);
        } else {
          return Image.asset(
            "assets/images/location_pick_icon.png",
            height: 60,
          );
        }
      },
    );
  }
}
