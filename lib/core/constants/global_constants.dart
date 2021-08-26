import 'package:flutter/cupertino.dart';

class GlobalConstant {
  
  static Color mainBack = Color(0xff73586E);
  static Color mainSoft = Color(0xffB0A4BF);
  static Color fontColorLive = Color(0xffE7DFF2);
  static Color fontColorAlternative = Color(0xffBF907E);
  static Color alternativeLive = Color(0xffD95043);
  static Color alternativeSoft = Color(0xff9DA65D);

  static List<Locale> supportedLanguages = [Locale("tr", "TR"), Locale("en", "US")];
  static Locale initialLanguage = Locale("tr", "TR");
  static Locale currentLocale = Locale("tr");
}
