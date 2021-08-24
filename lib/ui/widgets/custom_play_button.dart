import 'package:flutter/material.dart';

class CustomPlayButton extends StatelessWidget {
  final int id;
  final String name;
  final bool isPlaying;
  final String iconUrl;
  final Function(int) onPlay;
  const CustomPlayButton({Key? key, required this.name, required this.iconUrl, required this.isPlaying,required this.onPlay, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPlay(id);
      },
      child: Container(
        color: isPlaying ? Colors.pink : Colors.pink.withOpacity(0.4),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(isPlaying ? Icons.stop : Icons.play_arrow),
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
