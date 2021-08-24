
import 'size_constant.dart';

enum EnumInputType {
  Name,
  RichText,
  Email,
  Password,
  Username,
}


enum EnumButtonType {
  Cancel,
  Confirm,
  Save,
}

enum EnumAlertType{
  Question,
  Duration,
  Error,
  Success,
  Warning,
  Info
}

enum HeadlineType{
  headline1,
  headline2,
  headline3,
  headline4,
  headline5
}

extension HeadlineExtension on HeadlineType {
   double get value {
    switch (this) {
      case HeadlineType.headline1:
        return SizeConstants.size48;
      case HeadlineType.headline2:
        return SizeConstants.size22;
      case HeadlineType.headline3:
        return SizeConstants.size18;
      case HeadlineType.headline4:
        return SizeConstants.size16;
      case HeadlineType.headline5:
        return SizeConstants.size12;
      default:
        return SizeConstants.size12;
    }
  }
}