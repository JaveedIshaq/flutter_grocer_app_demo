import 'package:flutter_grocer_app/core/config/colors.dart';
import 'package:flutter/material.dart';

class LargeButton extends StatefulWidget {
  final String title;
  final Function onPressed;
  final Color bgColor;

  const LargeButton({
    Key key,
    @required this.title,
    @required this.onPressed,
    @required this.bgColor,
  }) : super(key: key);

  @override
  _LargeButtonState createState() => _LargeButtonState();
}

class _LargeButtonState extends State<LargeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 50,
      child: FlatButton(
        onPressed: this.widget.onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: widget.bgColor,
        disabledColor: grocerGreenDark,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0),
            side: BorderSide(color: Colors.transparent)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              this.widget.title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
