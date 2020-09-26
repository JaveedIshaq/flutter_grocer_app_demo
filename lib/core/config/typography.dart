import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle addressInputHintTextStyle = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Colors.grey,
  ),
);

InputDecoration buildInputDecoration(
    String hintText, bool suffixIconTrueFalse) {
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(10, 6, 10, 6),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(width: 1, color: Colors.grey[500]),
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          width: 1,
        )),
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: addressInputHintTextStyle,
    prefixIcon: Icon(Icons.search),
  );
}
