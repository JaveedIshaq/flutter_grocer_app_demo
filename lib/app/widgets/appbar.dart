import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class TopAppBar extends StatefulWidget {
  final bool canGoBack;
  final bool hideAccount;

  const TopAppBar({
    Key key,
    this.canGoBack = false,
    this.hideAccount = false,
  }) : super(key: key);

  @override
  _TopAppBarState createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  @override
  Widget build(BuildContext context) {
    //var user = Provider.of<User>(context);

    return SizedBox(
      height: 80,
      child: Row(
        children: <Widget>[
          SizedBox(width: 10),
          widget.canGoBack
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Theme.of(context).accentColor,
                  icon: Icon(Icons.arrow_back_ios),
                )
              : IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  color: Colors.white,
                  icon: Image.asset("assets/images/drawer-menu-icon.png"),
                ),
          SizedBox(width: 10),
          Spacer(),
          Container(),
          SizedBox(width: 20),
        ],
      ),
    );
  }

  // Widget buildCircleAvatar(User user) {
  //   if (user != null && user.photoURL.isNotEmpty) {
  //     return Container(
  //       width: 50,
  //       child: ClipOval(
  //         child: FadeInImage.memoryNetwork(
  //           placeholder: kTransparentImage,
  //           image: user.photoURL,
  //           fit: BoxFit.contain,
  //         ),        image: user.photoURL,

  //       ),
  //     );
  //   }

  //   return Container();
  // }
}
