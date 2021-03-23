import 'package:flutter/material.dart';

class MainTheme {
  MainTheme({
    this.outerShadow,
    this.innerShadowColors,
    this.borderColor,
    this.buttonColor,
    this.mainBackground,
    this.mainText,
    this.mainIcon,
    this.purple,
    this.subTextColor
  });

  final List<BoxShadow> outerShadow;
  final List<Color> innerShadowColors;
  final Color borderColor;
  final Color buttonColor;
  final Color mainBackground;
  final Color mainText;
  final Color mainIcon;
  final Color purple;
  final Color subTextColor;
}

final theme = MainTheme(
    innerShadowColors: [tDarkShadow, Colors.white],
    borderColor: Colors.transparent,
    buttonColor: tBackgroundColour,
    outerShadow: [
      BoxShadow(
        blurRadius: 8,
        offset: -Offset(5, 5),
        color: Colors.white,
      ),
      BoxShadow(
        blurRadius: 8,
        offset: Offset(4.5, 4.5),
        color: tDarkShadow,
      )
    ],
    mainBackground: tMainBackground,
    mainText: tMainText,
    mainIcon: tMainIcon,
    purple: tPurple,
    subTextColor: tSubTextColor
);

final tBackgroundColour = Color(0xFFE5EDF3);
final tDarkShadow = Color(0x7A88A5BF);

final tMainBackground = Color(0xFFE5EDF3);
final tMainText = Color(0xFF37494F);
final tMainIcon = Color(0xFF5F6B71);
final tPurple = Color(0xFF7461F0);
final tSubTextColor = Color(0xFF37494F);
