import 'package:flutter/material.dart';
import 'package:sleep_baby/core/constants/global_constants.dart';
import 'package:sleep_baby/core/constants/size_constant.dart';
import 'package:sleep_baby/ui/services/ad_utils.dart';

class CustomPlayButton extends StatelessWidget {
  final int id;
  final String name;
  final bool isPlaying;
  final String iconUrl;
  final Function(int) onPlay;
  const CustomPlayButton(
      {Key? key, required this.name, required this.iconUrl, required this.isPlaying, required this.onPlay, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AdUtil.openRandomIntersititalAd();
        onPlay(id);
      },
      child: Container(
        color: isPlaying ? GlobalConstant.alternativeLive : GlobalConstant.alternativeLive.withOpacity(0.5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isPlaying ? Icons.stop : Icons.play_arrow,
                color: GlobalConstant.fontColorLive,
              ),
              SizedBox(
                height: SizeConstants.size8,
              ),
              Text(
                name,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
