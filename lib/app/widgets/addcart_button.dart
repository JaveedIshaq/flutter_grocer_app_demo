import 'package:flutter_grocer_app/core/config/colors.dart';
import 'package:flutter/material.dart';

class AddCartButton extends StatefulWidget {
  final String title;
  final Function onPressed;
  final Color bgColor;

  const AddCartButton({
    Key key,
    @required this.title,
    @required this.onPressed,
    @required this.bgColor,
  }) : super(key: key);

  @override
  _AddCartButtonState createState() => _AddCartButtonState();
}

class _AddCartButtonState extends State<AddCartButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 40,
      child: FlatButton(
        onPressed: this.widget.onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: widget.bgColor,
        disabledColor: grocerGreenDark,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
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
