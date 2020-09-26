import 'package:flutter_grocer_app/app/screens/products/products.dart';
import 'package:flutter_grocer_app/app/widgets/large_button.dart';
import 'package:flutter_grocer_app/core/config/config.dart';
import 'package:flutter_grocer_app/app/widgets/app_drawer.dart';
import 'package:flutter_grocer_app/core/providers/categories_provider.dart';
import 'package:flutter_grocer_app/core/providers/deals_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grocer_app/core/providers/feature_products_provider.dart';
import 'package:flutter_grocer_app/core/providers/slider_provider.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'widgets/map_body.dart';

class Home extends StatefulWidget {
  static const String route = "/";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Location location = new Location();

  @override
  void initState() {
    Provider.of<DealsProvider>(context, listen: false).getDelasProductsList();
    Provider.of<FeaturesProductsProvider>(context, listen: false)
        .getFeaturedProductsList();
    Provider.of<CategoriesProvider>(context, listen: false).getCategoriesList();
    Provider.of<SlidersProvider>(context, listen: false).getSlidersList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(child: AppDrawer()),
      body: (ViewState.Idle == ViewState.Busy)
          ? Center(child: CircularProgressIndicator())
          : Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                MapBody(),
                Positioned(
                  bottom: 30,
                  left: 30,
                  child: LargeButton(
                    bgColor: grocerGreenDark,
                    title: "Proceed",
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Products()));
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

class ChooseLocationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {
              //Navigator.pushNamed(context, LocationSelection.route);
            },
            child: Container(
              width: double.infinity,
              color: Colors.grey[300],
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 12),
                child: Text(
                  "Select Location",
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey[400],
                child: Icon(
                  Icons.star,
                  color: Colors.white,
                )),
            title: Text("Choose From saved Places"),
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => SavedLocationSelection()));
            },
          )
        ],
      ),
    );
  }
}
