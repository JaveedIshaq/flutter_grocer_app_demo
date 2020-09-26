import 'package:flutter/material.dart';
import 'drawer_icon.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({
    Key key,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.green[300],
      width: deviceSize.width,
      height: 80,
      padding: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          DrawerIcon(scaffoldKey: _scaffoldKey),
        ],
      ),
    );
  }
}
