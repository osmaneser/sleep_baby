import 'package:flutter/material.dart';
import '../constants/global_constants.dart';

class OeCustomCard extends StatelessWidget {
  final Widget child;
  const OeCustomCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: GlobalConstant.alternativeSoft,
      elevation: 2,
      child: child,
    );
  }
}
