import 'package:flutter/material.dart';
import '../../core/constants/custom_enums.dart';
import '../../core/constants/global_constants.dart';

class CustomHeadlineText extends StatelessWidget {
  final HeadlineType headline;
  final String text;
  const CustomHeadlineText({ Key? key, required this.text,required this.headline }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: GlobalConstant.fontColorLive,
        fontSize: headline.value,
        fontWeight: FontWeight.bold
      ),
    );
  }
}