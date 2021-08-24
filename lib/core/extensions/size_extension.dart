import 'package:flutter/cupertino.dart';
import '../../core/constants/size_constant.dart';

extension SizeExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  EdgeInsets get p_8 => EdgeInsets.all(SizeConstants.size8);
  EdgeInsets get p_16 => EdgeInsets.all(SizeConstants.size16);
  EdgeInsets get p_32 => EdgeInsets.all(SizeConstants.size22);
}
