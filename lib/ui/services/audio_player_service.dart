
// class AudioPlayerTask extends BackgroundAudioTask {
//   final _audioPlay = AudioPlayer();

//   @override
//   Future<void> onStart(Map<String, dynamic>? params) async {
//     AudioServiceBackground.setState(
//       controls: [MediaControl.pause, MediaControl.stop],
//       playing: true,
//       processingState: AudioProcessingState.connecting,
//     );
//     await _audioPlay.setUrl("https://osmaneser.com/baby_sleep/ses-1.mp3");
//     _audioPlay.play();

//     return super.onStart(params);
//   }

//   @override
//   Future<void> onStop() async {
//     AudioServiceBackground.setState(
//       controls: [MediaControl.play],
//       playing: true,
//       processingState: AudioProcessingState.connecting,
//     );
//     await _audioPlay.stop();
//     return super.onStop();
//   }
// }
