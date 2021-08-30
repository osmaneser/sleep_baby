import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:sleep_baby/ui/models/res_voice.dart';
import 'package:sleep_baby/ui/modules/home/home_view_model.dart';
import 'package:sleep_baby/ui/services/ad_utils.dart';
import 'package:sleep_baby/ui/widgets/custom_play_button.dart';

class ContentButton extends StatefulWidget {
  const ContentButton({Key? key}) : super(key: key);

  @override
  _ContentButtonState createState() => _ContentButtonState();
}

class _ContentButtonState extends State<ContentButton> {
  List<ResVoice> listVoice = [];

  @override
  void initState() {
    initAudioState();
    initDataVoice();
    super.initState();
  }

  initDataVoice() async {
    final vModel = Provider.of<HomeViewModel>(context, listen: false);
    await vModel.getVoices(0);
  }

  initAudioState() async {
    await AudioService.connect();
  }

  @override
  void dispose() {
    AudioService.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, vModel, child) {
        if (vModel.listVoice.length == 0) {
          return Text("Boş");
        } else {
          return Column(
            children: [getItem(vModel.listVoice.take(3).toList(), vModel), getItem(vModel.listVoice.skip(3).take(3).toList(), vModel)],
          );
        }
      },
    );
  }

  Widget getItem(List<ResVoice> listVoice, HomeViewModel vModel) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: listVoice
            .map((e) => Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomPlayButton(
                      name: e.name,
                      iconUrl: "",
                      isPlaying: e.id == vModel.selectedVoiceId,
                      id: e.id,
                      onPlay: (int val) async {
                        if (vModel.selectedVoiceId == val) {
                          vModel.voiceStop();
                          AudioService.stop();
                          AdUtil.openRandomIntersititalAd();
                        } else {
                          vModel.changeVoice(val);
                          await AudioService.stop();
                          AudioService.start(backgroundTaskEntrypoint: _backgroundEntrypoint, params: {"url": e.voiceUrl});
                        }
                        setState(() {});
                      }),
                )))
            .toList(),
      ),
    );
  }
}

_backgroundEntrypoint() {
  AudioServiceBackground.run(() => AudioPlayerTask());
}

class AudioPlayerTask extends BackgroundAudioTask {
  final _audioPlay = AudioPlayer();

  @override
  Future<void> onStart(Map<String, dynamic>? params) async {
    var urlKey = params?.keys.firstWhere((k) => k == 'url', orElse: () => "");

    if (urlKey != null && urlKey.isNotEmpty && params?[urlKey] != "") {
      // final mediaItem = MediaItem(id: params?[urlKey], album: "", title: "");

      // AudioServiceBackground.setMediaItem(mediaItem);

      AudioServiceBackground.setState(
        controls: [MediaControl.pause, MediaControl.stop],
        playing: true,
        processingState: AudioProcessingState.connecting,
      );

      await _audioPlay.setUrl(params?[urlKey]);
      _audioPlay.play();
      return super.onStart(params);
    } else {
      AudioService.stop();
    }
  }

  @override
  Future<void> onStop() async {
    AudioServiceBackground.setState(
      controls: [MediaControl.play],
      playing: false,
      processingState: AudioProcessingState.connecting,
    );
    await _audioPlay.stop();
    return super.onStop();
  }
}
