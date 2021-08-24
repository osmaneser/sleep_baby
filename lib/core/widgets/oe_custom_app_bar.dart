import 'package:flutter/material.dart';
import '../constants/global_constants.dart';

class OeCustomAppBar extends StatelessWidget {
  final Widget title;
  final void Function()? onBackButton;
  const OeCustomAppBar({Key? key, required this.title, this.onBackButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: GlobalConstant.mainBack,
      leading: IconButton(
        icon: Icon(
          Icons.chevron_left,
          color: GlobalConstant.fontColorLive,
          size: 30,
        ),
        onPressed: () {
          onBackButton != null ? onBackButton : Navigator.of(context).pop();
        },
      ),
      title: title,
      actions: [],
      centerTitle: true,
    );
  }
}
