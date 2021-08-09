import 'package:flutter/material.dart';
import 'package:padillionradio/models/audiofile.dart';
import 'package:padillionradio/playerButtons.dart';
import 'package:provider/provider.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  void initState() {
    super.initState();
  }

  //TODO: add pausing audio

  @override
  Widget build(BuildContext context) {
    final audioFile = ModalRoute.of(context)!.settings.arguments as AudioFile;


   var consumer =  Consumer<MyAudio>(
      builder:(_, myAudioModel, child) =>

          Column(
            children: [

              Text(myAudioModel.totalDuration.toString().split('.').first),
              Text(myAudioModel.currentPosition.toString().split('.').first),
              Text(myAudioModel.audioState.toString()),

              SliderTheme(
                data: SliderThemeData(
                    trackHeight: 5,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5)
                ),
                child:  Slider(
                  value: myAudioModel.currentPosition == Duration() ? 0 : myAudioModel.currentPosition.inMilliseconds.toDouble() ,
                  activeColor: Color(0xff6f3d2e),
                  inactiveColor: Color(0xff6f3d2e).withOpacity(0.3),
                  onChanged: (value) {

                    myAudioModel.seekAudio(Duration(milliseconds: value.toInt()));

                  },
                  min: 0,
                  max:myAudioModel.totalDuration== Duration() ? 20 : myAudioModel.totalDuration.inMilliseconds.toDouble() ,
                ),
              ),

            ],
          ),
    );


    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [

            consumer,
            PlayerControls(),
          ],
        ),
      ),
    );
  }
}
