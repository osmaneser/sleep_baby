import 'package:flutter/material.dart';

class OeContentImage extends StatelessWidget {
  final String path;
  final List<BoxShadow>? boxShadow;
  final BorderRadius? borderRadius;
  const OeContentImage({Key? key, required this.path, this.boxShadow, this.borderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: boxShadow != null ? boxShadow : [],
        image: DecorationImage(image: NetworkImage(path), fit: BoxFit.cover),
      ),
    );
  }
}
