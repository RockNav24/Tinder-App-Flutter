import 'package:flutter/material.dart';

const kDefaultPadding = EdgeInsets.symmetric(
  vertical: 36.0,
  horizontal: 26.0,
);

const kPrimaryColor = Color(0xFFFCFCFC);
const kSecondaryColor = Color(0xFF424242);
const kAccentColor = Color(0xffb667c9);

const kColorPrimaryVariant = Color(0xFF424242);

const kBackgroundColor = Color(0xFF1D1C1C);
const kBackgroundColorInt = 0xFF1D1C1C;
const kFontFamily = 'Nunito';

const kTextTheme = TextTheme(
  headline1: TextStyle(),
  bodyText1: TextStyle(),
  bodyText2: TextStyle(),
);

const kButtonTheme = ButtonThemeData(
  splashColor: Colors.transparent,
  padding: EdgeInsets.symmetric(vertical: 14),
  buttonColor: kAccentColor,
  textTheme: ButtonTextTheme.primary,
  highlightColor: Color.fromRGBO(255, 255, 255, .3),
  focusColor: Color.fromRGBO(255, 255, 255, .3),
);

const Map<int, Color> kThemeMaterialColor = {
  50: Color.fromRGBO(255, 255, 255, .1),
  100: Color.fromRGBO(255, 255, 255, .2),
  200: Color.fromRGBO(255, 255, 255, .3),
  300: Color.fromRGBO(255, 255, 255, .4),
  000: Color.fromRGBO(255, 255, 255, .5),
  500: Color.fromRGBO(255, 255, 255, .6),
  600: Color.fromRGBO(255, 255, 255, .7),
  700: Color.fromRGBO(255, 255, 255, .8),
  800: Color.fromRGBO(255, 255, 255, .9),
  900: Color.fromRGBO(255, 255, 255, 1),
};

TextStyle greyTextBold = const TextStyle(
  fontSize: 16,
  color: Colors.grey,
  fontWeight: FontWeight.w500,
);

TextStyle profileSubTextStyle = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w300,
);

const List<String> kRecordingStyle = ["Audio", "Video", "Both"];
const Map<String, ImageProvider> kSocialMediaImages = {
  "fb": NetworkImage(
      "https://upload.wikimedia.org/wikipedia/en/thumb/0/04/Facebook_f_logo_%282021%29.svg/150px-Facebook_f_logo_%282021%29.svg.png"),
  "twitter": NetworkImage(
      "https://fye.sa.ua.edu/wp-content/uploads/sites/14/twitter-logo.png"),
  "instagram": NetworkImage(
      "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Instagram_logo_2022.svg/300px-Instagram_logo_2022.svg.png"),
};
