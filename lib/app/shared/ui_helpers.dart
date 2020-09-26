import 'package:flutter/material.dart';
import 'package:flutter_grocer_app/core/config/config.dart';

/// Contains useful functions to reduce boilerplate code
class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static const double _VerticalSpaceSmall = 10.0;
  static const double _VerticalSpaceMedium = 20.0;
  static const double _VerticalSpaceLarge = 60.0;

  // Vertical spacing constants. Adjust to your liking.
  static const double _HorizontalSpaceSmall = 10.0;
  static const double _HorizontalSpaceMedium = 20.0;
  static const double HorizontalSpaceLarge = 60.0;

  /// Returns a vertical space with height set to [_VerticalSpaceSmall]
  static Widget verticalSpaceSmall() {
    return verticalSpace(_VerticalSpaceSmall);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceMedium]
  static Widget verticalSpaceMedium() {
    return verticalSpace(_VerticalSpaceMedium);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceLarge]
  static Widget verticalSpaceLarge() {
    return verticalSpace(_VerticalSpaceLarge);
  }

  /// Returns a vertical space equal to the [height] supplied
  static Widget verticalSpace(double height) {
    return Container(height: height);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceSmall]
  static Widget horizontalSpaceSmall() {
    return horizontalSpace(_HorizontalSpaceSmall);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceMedium]
  static Widget horizontalSpaceMedium() {
    return horizontalSpace(_HorizontalSpaceMedium);
  }

  /// Returns a vertical space with height set to [HorizontalSpaceLarge]
  static Widget horizontalSpaceLarge() {
    return horizontalSpace(HorizontalSpaceLarge);
  }

  /// Returns a vertical space equal to the [width] supplied
  static Widget horizontalSpace(double width) {
    return Container(width: width);
  }

  static const enabledBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );

  static const enabledBorderTransparent = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  );

  static const focusedBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: grocerGreen,
    ),
  );
  static const errorBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
    ),
  );

  static inputDecoration(String helperText) => InputDecoration(
        hintText: '301 2345678',
        helperText: helperText,
        contentPadding: EdgeInsets.only(left: 5, top: 20, right: 15, bottom: 0),
        enabledBorder: UIHelper.enabledBorder,
        focusedBorder: UIHelper.focusedBorder,
        focusedErrorBorder: UIHelper.errorBorder,
        errorBorder: UIHelper.errorBorder,
      );
  static inputDecorationWelcome(String helperText) => InputDecoration(
        hintText: 'Enter your mobile number',
        helperText: "",
        contentPadding: EdgeInsets.only(left: 5, top: 20, right: 15, bottom: 0),
        enabledBorder: UIHelper.enabledBorder,
        focusedBorder: UIHelper.focusedBorder,
        focusedErrorBorder: UIHelper.errorBorder,
        errorBorder: UIHelper.errorBorder,
      );
  static inputDecorationWhite(String helperText) => InputDecoration(
        hintText: '',
        helperText: helperText,
        enabledBorder: UIHelper.enabledBorderTransparent,
        disabledBorder: UIHelper.enabledBorderTransparent,
        focusedBorder: UIHelper.focusedBorder,
        focusedErrorBorder: UIHelper.errorBorder,
        errorBorder: UIHelper.errorBorder,
      );

  static inputDecorationAuth(String hintText) => InputDecoration(
        hintText: hintText,
        helperText: "",
        contentPadding: EdgeInsets.only(left: 5, top: 20, right: 15, bottom: 0),
        enabledBorder: UIHelper.enabledBorder,
        focusedBorder: UIHelper.focusedBorder,
        focusedErrorBorder: UIHelper.errorBorder,
        errorBorder: UIHelper.errorBorder,
      );
}
