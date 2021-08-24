import 'package:flutter/material.dart';
import '../../../core/extensions/size_extension.dart';

class CustomCircleImage extends StatelessWidget {
  final String imgUrl;
  const CustomCircleImage({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: context.p_8,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              offset: Offset(1,2),
              spreadRadius: 0.1
            )
          ],
          image: DecorationImage(
            image: NetworkImage(
              imgUrl,
            ),
            fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}
