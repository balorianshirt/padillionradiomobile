import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:padillionradio/models/audiofile.dart';
import 'package:padillionradio/player.dart';
import 'package:provider/provider.dart';

class PlaylistPage extends StatefulWidget {
  @override

  _PlaylistPageState createState() => _PlaylistPageState();
}

List<AudioFile> audioList = [
  AudioFile(
      title: 'Daddy Issues',
      description: 'The Neighborhood',
      url:
      'https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4',
      playingStatus: 0),
  AudioFile(
      title: 'Games',
      description: 'Tessa Violet',
      url:
      'https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4',
      playingStatus: 0),
  AudioFile(
      title: 'Stay with me',
      description: 'witchhouse',
      url:
      'https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4',
      playingStatus: 0)
];

class _PlaylistPageState extends State<PlaylistPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Audio List'),
        ),
        body: MyItem(
          audioPlayer: audioPlayer,
        ));
  }
}

class MyItem extends StatefulWidget {
  final AudioPlayer audioPlayer;
  const MyItem({Key? key, required this.audioPlayer}) : super(key: key);
  @override

  _MyItemState createState() => _MyItemState();
}

class _MyItemState extends State<MyItem> {
  @override

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: audioList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () async {
            print(audioList[index].url);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                    create: (_) => MyAudio(audioList[index]),
                    child: PlayerPage()),
                settings: RouteSettings(
                  arguments: audioList[index],
                ),
              ),
            );
          },
          child: ListTile(
            leading: Icon(Icons.music_note_outlined),
            title: Text(audioList[index].title),
            subtitle: Text(audioList[index].description),
            trailing: Icon(Icons.style),
          ),
        );
      },
    );
  }
}