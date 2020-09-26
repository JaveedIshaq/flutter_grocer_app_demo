import 'package:flutter/material.dart';

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({
    Key key,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _scaffoldKey.currentState.openDrawer(),
      child: Container(
        margin: EdgeInsets.only(left: 10, top: 15),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey.shade300,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset("assets/images/drawer-menu-icon.png"),
          ),
        ),
      ),
    );
  }
}
