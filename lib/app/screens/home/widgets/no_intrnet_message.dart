import 'package:flutter_grocer_app/app/shared/shared.dart';
import 'package:flutter/material.dart';

class NoInternetMessage extends StatelessWidget {
  const NoInternetMessage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: NoInternetWidget(),
    );
  }
}
