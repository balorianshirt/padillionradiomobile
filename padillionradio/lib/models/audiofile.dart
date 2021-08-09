import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioFile {
  final String title;
  final String description;
  final String url;
  int playingStatus;

  AudioFile(
      {required this.title,
      required this.description,
      required this.url,
      this.playingStatus = 0});
}

class MyAudio extends ChangeNotifier {

  AudioPlayer audioPlayer = AudioPlayer();

  String audioState = '';
  Duration totalDuration = Duration();
  Duration currentPosition = Duration();

  MyAudio(AudioFile audioFile){
    setAudio(audioFile.url);
    initAudio();
  }

  initAudio() {

    print('I initiated, mom!');

    stopAudio();

    audioPlayer.onDurationChanged.listen((updatedDuration) {
        totalDuration = updatedDuration;
        notifyListeners();
    });

    audioPlayer.onAudioPositionChanged.listen((updatedPosition) {

        currentPosition = updatedPosition;
        notifyListeners();
    });

    audioPlayer.onPlayerStateChanged.listen((playerState) {
      if (playerState == PlayerState.STOPPED) audioState = 'Stopped';
      if (playerState == PlayerState.PLAYING) audioState = 'Playing';
      if (playerState == PlayerState.PAUSED) audioState = 'Paused';
      notifyListeners();
    });
  }

  setAudio(String url) async {
    await audioPlayer.setUrl(url);
  }

  playAudio() async {
    await audioPlayer.resume();
  }

  pauseAudio() async {
    await audioPlayer.pause();
  }

  stopAudio() async {
    await audioPlayer.stop();
  }

  seekAudio(Duration durationToSeek){
    audioPlayer.seek(durationToSeek);
  }
}
