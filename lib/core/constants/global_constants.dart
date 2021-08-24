import 'package:flutter/cupertino.dart';

class GlobalConstant {
  
  static Color mainBack = Color(0xff202426);
  static Color mainSoft = Color(0xffF0F2BB);
  static Color fontColorLive = Color(0xffF0F2BB);
  static Color fontColorAlternative = Color(0xff590202);
  static Color alternativeLive = Color(0xff9DA65D);
  static Color alternativeSoft = Color(0xff9DA65D);

  static List<Locale> supportedLanguages = [Locale("tr", "TR"), Locale("en", "US")];
  static Locale initialLanguage = Locale("tr", "TR");
  static Locale currentLocale = Locale("tr");
}
