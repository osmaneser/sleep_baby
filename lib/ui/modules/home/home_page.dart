import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sleep_baby/core/constants/size_constant.dart';
import 'package:sleep_baby/core/widgets/image/oe_custom_content_image.dart';
import 'package:sleep_baby/ui/modules/category/horizontal_category.dart';
import 'package:sleep_baby/ui/services/ad_utils.dart';

import 'content_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 20,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          AdUtil.openIntersititalAd();
                        },
                        child: Image.asset(
                          "assets/logo/w-house-logo-512x512.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
          Expanded(
            flex: 10,
            child: AdUtil.openBannerAd(),
          ),
          Spacer(
            flex: 1,
          ),
          CategoryHorizontal(),
          Expanded(flex: 30, child: ContentButton()),
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 30,
            child: GestureDetector(
              onTap: () {
                AdUtil.openIntersititalAd();
              },
              child: OeContentImage(path: "https://osmaneser.com/baby_sleep/images/home-image.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}
