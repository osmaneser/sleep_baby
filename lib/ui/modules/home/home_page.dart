import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:sleep_baby/core/widgets/image/oe_custom_content_image.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sleep_baby/ui/models/res_voice.dart';
import 'package:sleep_baby/ui/modules/category/horizontal_category.dart';
import 'package:sleep_baby/ui/services/ad_utils.dart';
import 'package:sleep_baby/ui/widgets/custom_play_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedVoiceId = 0;
  @override
  void initState() {
    initAudioState();
    super.initState();
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
    List<ResVoice> listVoice = [
      ResVoice(categoryId: 1, id: 1, name: "Kurutma", voiceUrl: "https://osmaneser.com/baby_sleep/ses-1.mp3"),
      ResVoice(categoryId: 1, id: 2, name: "Çamaşır", voiceUrl: "https://osmaneser.com/baby_sleep/ses-2.mp3"),
      ResVoice(categoryId: 1, id: 3, name: "Bulaşık", voiceUrl: "https://osmaneser.com/baby_sleep/ses-3.mp3"),
      ResVoice(categoryId: 1, id: 4, name: "Süpürge", voiceUrl: "https://osmaneser.com/baby_sleep/ses-4.mp3"),
      ResVoice(categoryId: 1, id: 5, name: "Son", voiceUrl: "https://osmaneser.com/baby_sleep/ses-5.mp3"),
      ResVoice(categoryId: 1, id: 6, name: "Süpürge", voiceUrl: "https://osmaneser.com/baby_sleep/ses-6.mp3"),
    ];
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 20, child: Center(child: Text("LOGO", style: TextStyle(color: Colors.white)))),
          Expanded(
            flex: 10,
            child: AdUtil.openBannerAd(),
          ),
          Spacer(
            flex: 1,
          ),
          CategoryHorizontal(),
          Expanded(
              flex: 30,
              child: Column(
                children: [
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: listVoice
                        .take(3)
                        .map((e) => Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomPlayButton(
                                  name: e.name,
                                  iconUrl: "",
                                  isPlaying: e.id == selectedVoiceId,
                                  id: e.id,
                                  onPlay: (int val) async{
                                    if (selectedVoiceId == val) {
                                        selectedVoiceId = 0;
                                        AudioService.stop();
                                      } else {
                                        selectedVoiceId = val;
                                        await AudioService.stop();
                                        AudioService.start(backgroundTaskEntrypoint: _backgroundEntrypoint, params: {"url":e.voiceUrl});
                                      }
                                    setState(() {
                                      
                                    });
                                  }),
                            )))
                        .toList(),
                  )),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: listVoice
                        .skip(3)
                        .take(3)
                        .map((e) => Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomPlayButton(
                                  name: e.name,
                                  iconUrl: "",
                                  isPlaying: e.id == selectedVoiceId,
                                  id: e.id,
                                  onPlay: (int val) async{
                                    if (selectedVoiceId == val) {
                                        selectedVoiceId = 0;
                                        AudioService.stop();
                                      } else {
                                        selectedVoiceId = val;
                                        await AudioService.stop();
                                        AudioService.start(backgroundTaskEntrypoint: _backgroundEntrypoint, params: {"url":e.voiceUrl});
                                      }
                                    setState(() {
                                      
                                    });
                                  }),
                            )))
                        .toList(),
                  )),
                ],
              )),
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 30,
            child: OeContentImage(
                path:
                    "https://media.istockphoto.com/photos/photo-of-baby-boy-sleeping-together-with-teddy-bear-picture-id1175501454?k=6&m=1175501454&s=612x612&w=0&h=_cSyxTorEJ-ynLwJBeZQlFTtUkB5CLpVsv5MaskpZ1o="),
          ),
        ],
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
      playing: true,
      processingState: AudioProcessingState.connecting,
    );
    await _audioPlay.stop();
    return super.onStop();
  }
}
