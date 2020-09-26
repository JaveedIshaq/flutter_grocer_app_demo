import 'package:flutter_grocer_app/core/config/colors.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          DrawerHeader(),
          SizedBox(height: 10),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.category),
            title: Text("Categories"),
          ),
          Divider(),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.shopping_cart),
            title: Text("My Cart"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.person),
            title: Text("My Profile"),
          ),
          Divider(),
          Spacer(),
          Divider(),
          ListTile(
            onTap: () async {},
            leading: Icon(Icons.exit_to_app),
            title: Text(
              "Logout",
              style: TextStyle(color: grocerGreen),
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}

class DrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      padding: EdgeInsets.only(left: 40, bottom: 20),
      color: grocerGreen,
      child: GestureDetector(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
              child: ClipOval(
                child: SizedBox(
                  width: 55,
                  height: 55,
                  child: Image.asset(
                    "assets/images/user.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'userDetail?.firstname',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),

            SizedBox(height: 5),
            // Text(
            //   '${userDetail?.email}',
            //   style: TextStyle(
            //     fontSize: 12,
            //     color: Colors.white,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
